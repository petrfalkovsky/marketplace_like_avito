import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutex/flutex.dart';

class SelectionWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final bool inkWell;
  final Color? highlightColor;
  final bool enabled;

  const SelectionWidget({
    required this.child,
    required this.onTap,
    this.inkWell = true,
    this.highlightColor,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    if (!enabled) return child;

    if (inkWell)
      return Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: highlightColor,
          child: child,
          onTap: onTap,
        ),
      );
    else
      return child.onTap(onTap);
  }
}
