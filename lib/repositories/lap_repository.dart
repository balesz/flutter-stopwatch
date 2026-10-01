import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lap_repository.freezed.dart';
part 'lap_repository.g.dart';

@riverpod
class LapRepository extends _$LapRepository {
  @override
  Future<List<LapEntity>> build() async {
    return [];
  }

  void clear() => update((_) {
    return [];
  });

  void add(Duration duration) {
    update((stt) => [...stt, LapEntity(duration)]);
  }
}

////////////////////////////////////////////////////////////////////////////////

@freezed
abstract class LapEntity with _$LapEntity {
  const factory LapEntity(
    Duration duration,
  ) = _LapEntity;
}
