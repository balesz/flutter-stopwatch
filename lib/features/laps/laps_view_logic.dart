import 'package:flutter_stopwatch/repositories/lap_repository.dart';
import 'package:flutter_stopwatch/utils/duration.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'laps_view_logic.freezed.dart';
part 'laps_view_logic.g.dart';

@riverpod
class LapsViewLogic extends _$LapsViewLogic {
  LapRepository get _repository => ref.read(lapRepositoryProvider.notifier);

  @override
  Future<LapsViewState> build() async {
    final laps = await ref.watch(lapRepositoryProvider.future);
    return LapsViewState(
      itemCount: laps.length,
    );
  }

  void clear() {
    _repository.clear();
  }
}

@riverpod
Future<(int, String)> lapsItem(Ref ref, int index) async {
  final laps = await ref.watch(lapRepositoryProvider.future);
  final lap = laps.reversed.elementAtOrNull(index);
  return (laps.length - index, lap?.duration.asDigitalText ?? '');
}

////////////////////////////////////////////////////////////////////////////////

@freezed
abstract class LapsViewState with _$LapsViewState {
  const factory LapsViewState({
    @Default(0) int itemCount,
  }) = _LapsViewState;
}
