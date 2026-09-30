// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stopwatch_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StopwatchService)
final stopwatchServiceProvider = StopwatchServiceProvider._();

final class StopwatchServiceProvider
    extends $StreamNotifierProvider<StopwatchService, StopwatchServiceState> {
  StopwatchServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stopwatchServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stopwatchServiceHash();

  @$internal
  @override
  StopwatchService create() => StopwatchService();
}

String _$stopwatchServiceHash() => r'5d066d55b67129ed04982ad79624f80d3aa841fc';

abstract class _$StopwatchService
    extends $StreamNotifier<StopwatchServiceState> {
  Stream<StopwatchServiceState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<StopwatchServiceState>, StopwatchServiceState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<StopwatchServiceState>,
                StopwatchServiceState
              >,
              AsyncValue<StopwatchServiceState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
