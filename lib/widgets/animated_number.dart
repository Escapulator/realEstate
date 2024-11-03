import 'package:flutter/material.dart';

class AnimatedNumber extends StatelessWidget {
  final int targetNumber;
  final Duration duration;
  final TextStyle style;

  const AnimatedNumber({
    super.key,
    required this.targetNumber,
    this.duration = const Duration(seconds: 2),
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: targetNumber),
      duration: duration,
      builder: (context, value, child) {
        return Text(
          '$value',
          style: style,
        );
      },
    );
  }
}
