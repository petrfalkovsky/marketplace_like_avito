import 'package:flutter/material.dart';

class IfBuild extends StatelessWidget {
  final bool check;
  final WidgetBuilder? ifFalse;
  final WidgetBuilder? ifTrue;

  const IfBuild({
    Key? key,
    required this.check,
    this.ifTrue,
    this.ifFalse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      (check ? ifTrue?.call(context) : ifFalse?.call(context)) ??
      SizedBox.shrink();
}
