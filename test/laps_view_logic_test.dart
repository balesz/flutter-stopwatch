import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stopwatch/features/laps/laps_view_logic.dart';
import 'package:flutter_stopwatch/repositories/lap_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'WHEN LapRepository is empty '
    'THEN the itemCount of LapsViewState is zero',
    () async {
      final container = ProviderContainer.test(
        overrides: [
          lapRepositoryProvider.overrideWithBuild((_, _) => []),
        ],
      );

      state() => container.read(lapsViewLogicProvider.future);
      container.listen(lapsViewLogicProvider, (_, _) {});

      expectLater(state(), completion(isA<LapsViewState>()));
      expectLater(state(), completion(equals(LapsViewState(itemCount: 0))));
    },
  );

  test(
    'WHEN LapRepository has one item'
    'THEN the itemCount of LapsViewState is one',
    () async {
      final container = ProviderContainer.test(
        overrides: [
          lapRepositoryProvider.overrideWithBuild((_, _) => [LapEntity(Duration(seconds: 2))]),
        ],
      );

      state() => container.read(lapsViewLogicProvider.future);
      container.listen(lapsViewLogicProvider, (_, _) {});

      expectLater(state(), completion(isA<LapsViewState>()));
      expectLater(state(), completion(equals(LapsViewState(itemCount: 1))));
    },
  );
}
