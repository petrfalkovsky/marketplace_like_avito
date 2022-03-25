import 'dart:math' as math;

import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';

class ChevronWidget extends StatelessWidget {
  final bool expanded;
  final Duration duration;

  const ChevronWidget({
    Key? key,
    required this.expanded,
    this.duration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
        end: expanded ? math.pi / 2 : 0,
      ),
      duration: duration,
      curve: Curves.easeInOutBack,
      child: Icon(
        Icons.chevron_right,
        color: nonActiveColor,
      ),
      builder: (context, value, child) {
        return Transform.rotate(
          angle: value,
          child: child,
        );
      },
    );
  }
}
