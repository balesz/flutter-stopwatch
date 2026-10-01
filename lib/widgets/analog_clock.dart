import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Analog clock face that shows the given [duration] with hour, minute and
/// second hands. Only the quarter positions (12, 3, 6, 9) are numbered.
///
/// Colors and text styles come from the ambient [Theme].
class AnalogClock extends StatelessWidget {
  const AnalogClock({super.key, required this.duration});

  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return AspectRatio(
      aspectRatio: 1.0,
      child: CustomPaint(
        painter: _AnalogClockPainter(
          duration: duration,
          faceColor: colorScheme.surfaceContainerHighest,
          borderColor: colorScheme.outlineVariant,
          majorTickColor: colorScheme.onSurfaceVariant,
          minorTickColor: colorScheme.outline,
          handColor: colorScheme.onSurface,
          secondHandColor: colorScheme.primary,
          labelStyle: (textTheme.titleLarge ?? const TextStyle()).copyWith(
            color: colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

class _AnalogClockPainter extends CustomPainter {
  _AnalogClockPainter({
    required this.duration,
    required this.faceColor,
    required this.borderColor,
    required this.majorTickColor,
    required this.minorTickColor,
    required this.handColor,
    required this.secondHandColor,
    required this.labelStyle,
  });

  final Duration duration;
  final Color faceColor;
  final Color borderColor;
  final Color majorTickColor;
  final Color minorTickColor;
  final Color handColor;
  final Color secondHandColor;
  final TextStyle labelStyle;

  static const _labels = {0: '12', 15: '3', 30: '6', 45: '9'};

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.shortestSide / 2;

    _paintFace(canvas, center, radius);
    _paintTicks(canvas, center, radius);
    _paintLabels(canvas, center, radius);
    _paintHands(canvas, center, radius);
  }

  void _paintFace(Canvas canvas, Offset center, double radius) {
    canvas.drawCircle(center, radius, Paint()..color = faceColor);
    canvas.drawCircle(
      center,
      radius - radius * 0.01,
      Paint()
        ..color = borderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = radius * 0.02,
    );
  }

  void _paintTicks(Canvas canvas, Offset center, double radius) {
    for (var i = 0; i < 60; i++) {
      final isMajor = i % 5 == 0;
      final outer = radius * 0.92;
      final inner = outer - radius * (isMajor ? 0.1 : 0.05);
      final direction = _direction(i / 60);
      canvas.drawLine(
        center + direction * inner,
        center + direction * outer,
        Paint()
          ..color = isMajor ? majorTickColor : minorTickColor
          ..strokeWidth = radius * (isMajor ? 0.025 : 0.01)
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  void _paintLabels(Canvas canvas, Offset center, double radius) {
    final style = labelStyle.copyWith(fontSize: radius * 0.16);
    for (final MapEntry(key: minute, value: text) in _labels.entries) {
      final painter = TextPainter(
        text: TextSpan(text: text, style: style),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout();
      final position = center + _direction(minute / 60) * radius * 0.66;
      painter.paint(canvas, position - Offset(painter.width / 2, painter.height / 2));
      painter.dispose();
    }
  }

  void _paintHands(Canvas canvas, Offset center, double radius) {
    final micros = duration.inMicroseconds;
    final seconds = (micros / Duration.microsecondsPerSecond) % 60;
    final minutes = (micros / Duration.microsecondsPerMinute) % 60;
    final hours = (micros / Duration.microsecondsPerHour) % 12;

    void hand(double turns, double length, double width, Color color) {
      final direction = _direction(turns);
      canvas.drawLine(
        center - direction * radius * 0.1,
        center + direction * radius * length,
        Paint()
          ..color = color
          ..strokeWidth = radius * width
          ..strokeCap = StrokeCap.round,
      );
    }

    hand(hours / 12, 0.45, 0.05, handColor);
    hand(minutes / 60, 0.7, 0.035, handColor);
    hand(seconds / 60, 0.82, 0.015, secondHandColor);

    canvas.drawCircle(center, radius * 0.04, Paint()..color = secondHandColor);
  }

  /// Unit vector pointing to [turns] of a full rotation, clockwise from 12.
  Offset _direction(double turns) {
    final angle = turns * 2 * math.pi - math.pi / 2;
    return Offset(math.cos(angle), math.sin(angle));
  }

  @override
  bool shouldRepaint(_AnalogClockPainter oldDelegate) =>
      oldDelegate.duration != duration ||
      oldDelegate.faceColor != faceColor ||
      oldDelegate.borderColor != borderColor ||
      oldDelegate.majorTickColor != majorTickColor ||
      oldDelegate.minorTickColor != minorTickColor ||
      oldDelegate.handColor != handColor ||
      oldDelegate.secondHandColor != secondHandColor ||
      oldDelegate.labelStyle != labelStyle;
}
