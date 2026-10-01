import 'package:flutter_stopwatch/services/stopwatch_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

void main() {
  const skip = false;

  test(
    'WHEN the start button is pressed '
    'THEN the stopwatch is running and the elapsed time is increasing',
    skip: skip,
    () async {
      final container = ProviderContainer.test();
      addTearDown(container.dispose);

      final service = container.read((stopwatchServiceProvider.notifier));
      state() => container.read(stopwatchServiceProvider.future);
      container.listen(stopwatchServiceProvider, (_, _) {});

      await expectLater(state(), completion(equals(StopwatchServiceState.stopped())));

      service.start();
      await Future.delayed(Duration(milliseconds: 1500));

      await expectLater(
        state(),
        completion(
          predicate<StopwatchServiceState>((val) {
            return switch (val) {
              StopwatchRunning(duration: > const Duration(seconds: 1)) => true,
              _ => false,
            };
          }),
        ),
      );
    },
  );

  test(
    'WHEN the pause button is pressed '
    'THEN the stopwatch is paused and the elapsed time stops increasing',
    skip: skip,
    () async {
      final container = ProviderContainer.test();
      addTearDown(container.dispose);

      final service = container.read((stopwatchServiceProvider.notifier));
      state() => container.read(stopwatchServiceProvider.future);
      container.listen(stopwatchServiceProvider, (_, _) {});

      await expectLater(state(), completion(equals(StopwatchServiceState.stopped())));

      service.start();
      await Future.delayed(Duration(milliseconds: 1500));
      service.pause();
      await Future.delayed(Duration(milliseconds: 1500));

      await expectLater(
        state(),
        completion(
          predicate<StopwatchServiceState>((val) {
            return switch (val) {
              StopwatchPaused(duration: > const Duration(seconds: 1) && < const Duration(seconds: 2)) => true,
              _ => false,
            };
          }),
        ),
      );
    },
  );

  test(
    'WHEN the reset button is pressed '
    'THEN the stopwatch is stopped, and the elapsed time stops increasing and is reset to zero',
    skip: skip,
    () async {
      final container = ProviderContainer.test();
      addTearDown(container.dispose);

      final service = container.read((stopwatchServiceProvider.notifier));
      state() => container.read(stopwatchServiceProvider.future);
      container.listen(stopwatchServiceProvider, (_, _) {});

      await expectLater(state(), completion(isA<StopwatchStopped>()));

      service.start();
      await Future.delayed(Duration(milliseconds: 1500));

      await expectLater(
        state(),
        completion(
          predicate<StopwatchServiceState>((val) {
            return switch (val) {
              StopwatchRunning(duration: > const Duration(seconds: 1)) => true,
              _ => false,
            };
          }),
        ),
      );

      service.reset();
      await Future.delayed(Duration(milliseconds: 1500));

      await expectLater(
        state(),
        completion(
          predicate<StopwatchServiceState>((val) {
            return switch (val) {
              StopwatchStopped() => true,
              _ => false,
            };
          }),
        ),
      );
    },
  );
}
