import 'package:flutter_stopwatch/services/stopwatch_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stopwatch_view_logic.freezed.dart';
part 'stopwatch_view_logic.g.dart';

@riverpod
class StopwatchViewLogic extends _$StopwatchViewLogic {
  StopwatchService get _service => ref.read(stopwatchServiceProvider.notifier);

  @override
  Future<StopwatchViewState> build() async {
    final stopwattch = await ref.watch(stopwatchServiceProvider.future);
    return StopwatchViewState(
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
  }
}

////////////////////////////////////////////////////////////////////////////////

extension on Duration {
  String get asDigitalText => [
    ...toString()
        .split(RegExp(r'[:\.]')) //
        .skip(1)
        .map((i) => int.parse(i))
        .map((i) => '$i'.padLeft(2, '0'))
        .map((i) => i.substring(0, 2)),
  ].join(':');
}

////////////////////////////////////////////////////////////////////////////////

@freezed
abstract class StopwatchViewState with _$StopwatchViewState {
  const factory StopwatchViewState({
    @Default(false) bool isPauseButtonVisible,
    @Default(false) bool isResetButtonVisible,
    @Default('00:00:00') String digitalText,
  }) = _StopwatchViewState;
}
