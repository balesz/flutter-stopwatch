import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_stopwatch/features/laps/laps_view_logic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LapsView extends HookConsumerWidget {
  const LapsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logic = ref.watch(lapsViewLogicProvider.notifier);
    final asyncState = ref.watch(lapsViewLogicProvider);

    if (asyncState.hasValue == false) {
      return Container();
    }

    final state = asyncState.requireValue;

    if (state.itemCount == 0) {
      return SizedBox(height: 150);
    }

    final scrollController = useScrollController();

    return Container(
      height: 150,
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Row(
        spacing: 16.0,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton.outlined(
            onPressed: logic.clear,
            icon: Icon(Icons.clear),
          ),
          Expanded(
            child: Scrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: state.itemCount,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, idx) => _LapItem(idx),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LapItem extends ConsumerWidget {
  const _LapItem(this.index);

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItem = ref.watch(lapsItemProvider(index));
    if (asyncItem.hasValue == false) return Container();
    final (idx, duration) = asyncItem.requireValue;
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '$idx\n\n$duration',
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextTheme.of(context).titleLarge,
          ),
        ),
      ),
    );
  }
}
