import 'package:flutter/material.dart';

class PrimaryColorOverride extends StatelessWidget {
  final Color color;
  final Widget child;

  const PrimaryColorOverride({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(primaryColor: color),
    );
  }
}
