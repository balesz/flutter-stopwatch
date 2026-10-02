import 'package:flutter_stopwatch/repositories/lap_repository.dart';
import 'package:flutter_stopwatch/services/stopwatch_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stopwatch_view_logic.freezed.dart';
part 'stopwatch_view_logic.g.dart';

@riverpod
class StopwatchViewLogic extends _$StopwatchViewLogic {
  StopwatchService get _service => ref.read(stopwatchServiceProvider.notifier);
  LapRepository get _lapRepo => ref.read(lapRepositoryProvider.notifier);

  bool _isAnalogClockVisible = false;

  @override
  Future<StopwatchViewState> build() async {
    final stopwattch = await ref.watch(stopwatchServiceProvider.future);
    return StopwatchViewState(
      isAnalogClockVisible: _isAnalogClockVisible,
      isLapButtonVisible: stopwattch is StopwatchRunning,
      isPauseButtonVisible: stopwattch is StopwatchRunning,
      isResetButtonVisible: stopwattch is! StopwatchStopped,
      duration: switch (stopwattch) {
        StopwatchRunning(:final duration) => duration,
        StopwatchPaused(:final duration) => duration,
        _ => Duration.zero,
      },
    );
  }

  void toggleAnalogClock() {
    _isAnalogClockVisible = !_isAnalogClockVisible;
    ref.invalidateSelf();
  }

  void start() {
    _service.start();
  }

  void pause() {
    _service.pause();
  }

  void reset() {
    _service.reset();
    _lapRepo.clear();
  }

  void lap() async {
    final stopwatch = await ref.read(stopwatchServiceProvider.future);
    if (stopwatch case StopwatchRunning(:final duration)) {
      _lapRepo.add(duration);
    }
  }
}

////////////////////////////////////////////////////////////////////////////////

@freezed
abstract class StopwatchViewState with _$StopwatchViewState {
  const factory StopwatchViewState({
    @Default(false) bool isAnalogClockVisible,
    @Default(false) bool isLapButtonVisible,
    @Default(false) bool isPauseButtonVisible,
    @Default(false) bool isResetButtonVisible,
    @Default(Duration.zero) Duration duration,
  }) = _StopwatchViewState;
}
