// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stopwatch_view_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StopwatchViewLogic)
final stopwatchViewLogicProvider = StopwatchViewLogicProvider._();

final class StopwatchViewLogicProvider
    extends $AsyncNotifierProvider<StopwatchViewLogic, StopwatchViewState> {
  StopwatchViewLogicProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stopwatchViewLogicProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stopwatchViewLogicHash();

  @$internal
  @override
  StopwatchViewLogic create() => StopwatchViewLogic();
}

String _$stopwatchViewLogicHash() =>
    r'aba5f8d82b23cb11338191ba8d1b90c9236ac3b7';

abstract class _$StopwatchViewLogic extends $AsyncNotifier<StopwatchViewState> {
  FutureOr<StopwatchViewState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<StopwatchViewState>, StopwatchViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<StopwatchViewState>, StopwatchViewState>,
              AsyncValue<StopwatchViewState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
