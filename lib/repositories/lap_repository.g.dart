// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lap_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LapRepository)
final lapRepositoryProvider = LapRepositoryProvider._();

final class LapRepositoryProvider
    extends $AsyncNotifierProvider<LapRepository, List<LapEntity>> {
  LapRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lapRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lapRepositoryHash();

  @$internal
  @override
  LapRepository create() => LapRepository();
}

String _$lapRepositoryHash() => r'e2c6a911375e329b4f5b93e59cf3e6681f513a5d';

abstract class _$LapRepository extends $AsyncNotifier<List<LapEntity>> {
  FutureOr<List<LapEntity>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<LapEntity>>, List<LapEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<LapEntity>>, List<LapEntity>>,
              AsyncValue<List<LapEntity>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
