// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laps_view_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LapsViewLogic)
final lapsViewLogicProvider = LapsViewLogicProvider._();

final class LapsViewLogicProvider
    extends $AsyncNotifierProvider<LapsViewLogic, LapsViewState> {
  LapsViewLogicProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lapsViewLogicProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lapsViewLogicHash();

  @$internal
  @override
  LapsViewLogic create() => LapsViewLogic();
}

String _$lapsViewLogicHash() => r'9da04e965aeab9983c6399fb75d134f4cf1c0a84';

abstract class _$LapsViewLogic extends $AsyncNotifier<LapsViewState> {
  FutureOr<LapsViewState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<LapsViewState>, LapsViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LapsViewState>, LapsViewState>,
              AsyncValue<LapsViewState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(lapsItem)
final lapsItemProvider = LapsItemFamily._();

final class LapsItemProvider
    extends
        $FunctionalProvider<
          AsyncValue<(int, String)>,
          (int, String),
          FutureOr<(int, String)>
        >
    with $FutureModifier<(int, String)>, $FutureProvider<(int, String)> {
  LapsItemProvider._({
    required LapsItemFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'lapsItemProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$lapsItemHash();

  @override
  String toString() {
    return r'lapsItemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<(int, String)> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<(int, String)> create(Ref ref) {
    final argument = this.argument as int;
    return lapsItem(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LapsItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$lapsItemHash() => r'4563412ace77cf70cf69d97eb9a6a03a1fa1f5d1';

final class LapsItemFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<(int, String)>, int> {
  LapsItemFamily._()
    : super(
        retry: null,
        name: r'lapsItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LapsItemProvider call(int index) =>
      LapsItemProvider._(argument: index, from: this);

  @override
  String toString() => r'lapsItemProvider';
}
