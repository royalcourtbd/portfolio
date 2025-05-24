import 'package:flutter/material.dart';

class AnimatedListItem extends StatelessWidget {
  const AnimatedListItem({
    super.key,
    required this.child,
    required this.index,
    this.duration = const Duration(milliseconds: 300),
    this.delayMultiplier = 50,
    this.verticalOffset = 20,
  });

  final Widget child;
  final int index;
  final Duration duration;
  final int delayMultiplier;
  final double verticalOffset;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(
        milliseconds: duration.inMilliseconds + (index * delayMultiplier),
      ),
      curve: Curves.easeInOut,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, verticalOffset * (1 - value)),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: child,
    );
  }
}
