import 'package:flutter_stopwatch/repositories/lap_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  test(
    'WHEN a new lap is added '
    'THEN the lap is in the repository',
    () async {
      final container = ProviderContainer.test();
      addTearDown(container.dispose);

      final repo = container.read(lapRepositoryProvider.notifier);
      state() => container.read(lapRepositoryProvider.future);
      container.listen(lapRepositoryProvider, (_, _) {});

      await expectLater(state(), completion(isList));
      await expectLater(state(), completion(isEmpty));
      repo.add(Duration(seconds: 2));
      await expectLater(state(), completion(isList));
      await expectLater(state(), completion(contains(LapEntity(Duration(seconds: 2)))));
    },
  );

  test(
    'WHEN the repository is cleared '
    'THEN the repository is empty',
    () async {
      final container = ProviderContainer.test();
      addTearDown(container.dispose);

      final repo = container.read(lapRepositoryProvider.notifier);
      state() => container.read(lapRepositoryProvider.future);
      container.listen(lapRepositoryProvider, (_, _) {});

      await expectLater(state(), completion(isList));
      await expectLater(state(), completion(isEmpty));
      repo.add(Duration(seconds: 2));
      await expectLater(state(), completion(isList));
      await expectLater(state(), completion(contains(LapEntity(Duration(seconds: 2)))));
      repo.clear();
      await expectLater(state(), completion(isList));
      await expectLater(state(), completion(isEmpty));
    },
  );
}
