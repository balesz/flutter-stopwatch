import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stopwatch/features/stopwatch/stopwatch_view_logic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'WHEN the stopwatch is stopped '
    'THEN the pause button is not visible '
    'AND the reset button is not visible '
    'AND the lap button is not visible',
    () async {
      final container = ProviderContainer.test();
      addTearDown(container.dispose);

      state() => container.read(stopwatchViewLogicProvider.future);
      container.listen(stopwatchViewLogicProvider, (_, _) {});

      expectLater(
        state(),
        completion(
          predicate<StopwatchViewState>((val) {
            return switch (val) {
              StopwatchViewState(
                isPauseButtonVisible: false,
                isResetButtonVisible: false,
                isLapButtonVisible: false,
              ) =>
                true,
              _ => false,
            };
          }),
        ),
      );
    },
  );

  test(
    'WHEN the stopwatch is running '
    'THEN the pause button is visible '
    'AND the reset button is visible '
    'AND the lap button is visible',
    () async {
      final container = ProviderContainer.test();
      addTearDown(container.dispose);

      final logic = container.read(stopwatchViewLogicProvider.notifier);
      state() => container.read(stopwatchViewLogicProvider.future);
      container.listen(stopwatchViewLogicProvider, (_, _) {});

      logic.start();
      await Future.delayed(Duration(milliseconds: 100));

      expectLater(
        state(),
        completion(
          predicate<StopwatchViewState>((val) {
            return switch (val) {
              StopwatchViewState(
                isPauseButtonVisible: true,
                isResetButtonVisible: true,
                isLapButtonVisible: true,
              ) =>
                true,
              _ => false,
            };
          }),
        ),
      );
    },
  );

  test(
    'WHEN the stopwatch is paused '
    'THEN the pause button is not visible '
    'AND the reset button is visible '
    'AND the lap button is not visible',
    () async {
      final container = ProviderContainer.test();
      addTearDown(container.dispose);

      final logic = container.read(stopwatchViewLogicProvider.notifier);
      state() => container.read(stopwatchViewLogicProvider.future);
      container.listen(stopwatchViewLogicProvider, (_, _) {});

      logic.start();
      await Future.delayed(Duration(milliseconds: 100));
      logic.pause();

      expectLater(
        state(),
        completion(
          predicate<StopwatchViewState>((val) {
            return switch (val) {
              StopwatchViewState(
                isPauseButtonVisible: false,
                isResetButtonVisible: true,
                isLapButtonVisible: false,
              ) =>
                true,
              _ => false,
            };
          }),
        ),
      );
    },
  );
}
