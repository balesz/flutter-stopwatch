import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stopwatch/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(skip: false, 'StopwatchView smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(child: const StopwatchApp()));

    await tester.pump(Duration(seconds: 1));

    expect(find.widgetWithText(FilledButton, 'Start'), findsOneWidget);
    expect(find.text('00:00:00'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, 'Start'));
    await tester.pump(Duration(seconds: 1));

    expect(find.widgetWithText(FilledButton, 'Pause'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Reset'), findsOneWidget);
    expect(find.text('00:00:00'), findsNothing);

    await tester.tap(find.widgetWithText(FilledButton, 'Reset'));
    await tester.pump(Duration(seconds: 1));

    expect(find.text('00:00:00'), findsOneWidget);
  });
}
