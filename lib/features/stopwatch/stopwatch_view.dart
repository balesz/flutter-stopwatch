import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stopwatch/features/laps/laps_view.dart';
import 'package:flutter_stopwatch/features/stopwatch/stopwatch_view_logic.dart';

class StopwatchView extends ConsumerWidget {
  const StopwatchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(stopwatchViewLogicProvider.select((i) => i.hasValue)) == false) {
      return CircularProgressIndicator();
    }

    Widget sliverGap(double gap) {
      return SliverPadding(padding: EdgeInsets.symmetric(vertical: gap / 2));
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          sliverGap(16.0),
          SliverToBoxAdapter(child: _DigitalClock()),
          sliverGap(16.0),
          SliverToBoxAdapter(child: const LapsView()),
          sliverGap(16.0),
          SliverToBoxAdapter(child: _Buttons()),
        ],
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
            builder: (ctx, ref, _) => Text(
              ref.watch(stopwatchViewLogicProvider.select((i) => i.requireValue.digitalText)),
              style: TextTheme.of(ctx).displayLarge,
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
      textStyle: TextTheme.of(context).displaySmall,
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
