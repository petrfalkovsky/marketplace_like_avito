import 'package:flutter/material.dart';

class BottomSafeArea extends StatelessWidget {
  final double height;

  const BottomSafeArea({
    this.height = 10,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height + MediaQuery.of(context).padding.bottom);
  }
}

class TopSafeArea extends StatelessWidget {
  final double height;

  const TopSafeArea({
    this.height = 10,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height + MediaQuery.of(context).padding.top);
  }
}
