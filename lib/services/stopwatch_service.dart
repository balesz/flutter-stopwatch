import 'dart:async';

import 'package:clock/clock.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stopwatch_service.freezed.dart';
part 'stopwatch_service.g.dart';

@riverpod
class StopwatchService extends _$StopwatchService {
  final _freq = Duration(milliseconds: 10);

  final _stopwatch = clock.stopwatch();

  @override
  Stream<StopwatchServiceState> build() async* {
    switch (_stopwatch) {
      case Stopwatch(isRunning: true):
        final completer = Completer();
        ref.onDispose(() => completer.complete());
        await for (final _ in Stream.periodic(_freq)) {
          if (completer.isCompleted) break;
          yield StopwatchServiceState.running(_stopwatch.elapsed);
        }
      case Stopwatch(isRunning: false, elapsed: > Duration.zero):
        yield StopwatchServiceState.paused(_stopwatch.elapsed);
      default:
        yield StopwatchServiceState.stopped();
    }
  }

  void start() {
    _stopwatch.start();
    ref.invalidateSelf();
  }

  void pause() {
    _stopwatch.stop();
    ref.invalidateSelf();
  }

  void reset() {
    _stopwatch
      ..stop()
      ..reset();
    ref.invalidateSelf();
  }
}

////////////////////////////////////////////////////////////////////////////////

@freezed
sealed class StopwatchServiceState with _$StopwatchServiceState {
  const factory StopwatchServiceState.stopped() = StopwatchStopped;
  const factory StopwatchServiceState.paused(Duration duration) = StopwatchPaused;
  const factory StopwatchServiceState.running(Duration duration) = StopwatchRunning;
}
