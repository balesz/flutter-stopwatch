import 'package:flutter_stopwatch/repositories/lap_repository.dart';
import 'package:flutter_stopwatch/services/stopwatch_service.dart';
import 'package:flutter_stopwatch/utils/duration.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stopwatch_view_logic.freezed.dart';
part 'stopwatch_view_logic.g.dart';

@riverpod
class StopwatchViewLogic extends _$StopwatchViewLogic {
  StopwatchService get _service => ref.read(stopwatchServiceProvider.notifier);
  LapRepository get _lapRepo => ref.read(lapRepositoryProvider.notifier);

  @override
  Future<StopwatchViewState> build() async {
    final stopwattch = await ref.watch(stopwatchServiceProvider.future);
    return StopwatchViewState(
      isLapButtonVisible: stopwattch is StopwatchRunning,
      isPauseButtonVisible: stopwattch is StopwatchRunning,
      isResetButtonVisible: stopwattch is! StopwatchStopped,
      digitalText: switch (stopwattch) {
        StopwatchRunning(:final duration) => duration.asDigitalText,
        StopwatchPaused(:final duration) => duration.asDigitalText,
        _ => '00:00:00',
      },
    );
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
    @Default(false) bool isLapButtonVisible,
    @Default(false) bool isPauseButtonVisible,
    @Default(false) bool isResetButtonVisible,
    @Default('00:00:00') String digitalText,
  }) = _StopwatchViewState;
}
