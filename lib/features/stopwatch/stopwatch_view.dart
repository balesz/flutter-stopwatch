import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stopwatch/features/laps/laps_view.dart';
import 'package:flutter_stopwatch/features/stopwatch/stopwatch_view_logic.dart';
import 'package:flutter_stopwatch/utils/duration.dart';
import 'package:flutter_stopwatch/widgets/analog_clock.dart';

class StopwatchView extends ConsumerWidget {
  const StopwatchView({super.key});

  Widget _sliverGap(double gap) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: gap / 2),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logic = ref.read(stopwatchViewLogicProvider.notifier);

    if (ref.watch(stopwatchViewLogicProvider.select((i) => i.hasValue)) == false) {
      return CircularProgressIndicator();
    }

    final isAnalogClockVisible = ref.watch(
      stopwatchViewLogicProvider.select((i) => i.requireValue.isAnalogClockVisible),
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            spacing: 4.0,
            children: [
              Text('Analog', style: TextTheme.of(context).titleLarge),
              Switch(value: isAnalogClockVisible, onChanged: (_) => logic.toggleAnalogClock()),
            ],
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          _sliverGap(16.0),
          if (isAnalogClockVisible)
            SliverToBoxAdapter(child: _AnalogClock())
          else
            SliverToBoxAdapter(child: _DigitalClock()),
          _sliverGap(16.0),
          SliverToBoxAdapter(child: const LapsView()),
          _sliverGap(16.0),
          SliverToBoxAdapter(child: _Buttons()),
        ],
      ),
    );
  }
}

class _AnalogClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      alignment: Alignment.center,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer(
            builder: (context, ref, child) => AnalogClock(
              duration: ref.watch(stopwatchViewLogicProvider.select((i) => i.requireValue.duration)),
            ),
          ),
        ),
      ),
    );
  }
}

class _DigitalClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer(
            builder: (context, ref, child) => Text(
              ref.watch(stopwatchViewLogicProvider.select((i) => i.requireValue.duration.asDigitalText)),
              style: TextTheme.of(context).displayLarge,
            ),
          ),
        ),
      ),
    );
  }
}

class _Buttons extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logic = ref.watch(stopwatchViewLogicProvider.notifier);

    final isLapButtonVisible = ref.watch(
      (stopwatchViewLogicProvider.select((i) => i.requireValue.isLapButtonVisible)),
    );

    final isResetButtonVisible = ref.watch(
      (stopwatchViewLogicProvider.select((i) => i.requireValue.isResetButtonVisible)),
    );

    final isPauseButtonVisible = ref.watch(
      (stopwatchViewLogicProvider.select((i) => i.requireValue.isPauseButtonVisible)),
    );

    final buttonStyle = FilledButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 64, vertical: 32),
      textStyle: TextTheme.of(context).headlineLarge,
    );

    return Column(
      spacing: 16.0,
      children: [
        if (isPauseButtonVisible)
          FilledButton(style: buttonStyle, onPressed: logic.pause, child: Text('Pause'))
        else
          FilledButton(style: buttonStyle, onPressed: logic.start, child: Text('Start')),
        if (isResetButtonVisible) //
          FilledButton(style: buttonStyle, onPressed: logic.reset, child: Text('Reset')),
        if (isLapButtonVisible) //
          FilledButton(style: buttonStyle, onPressed: logic.lap, child: Text('Lap')),
      ],
    );
  }
}
