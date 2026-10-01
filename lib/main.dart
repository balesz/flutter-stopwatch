import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stopwatch/features/stopwatch/stopwatch_view.dart';

void main() {
  runApp(
    ProviderScope(
      child: const StopwatchApp(),
    ),
  );
}

class StopwatchApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.green)),
      home: const StopwatchView(),
    );
  }
}
