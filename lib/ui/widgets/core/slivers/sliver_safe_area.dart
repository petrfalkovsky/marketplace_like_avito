import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';

class SliverBottomSafeArea extends StatelessWidget {
  final double height;

  const SliverBottomSafeArea({
    this.height = 10,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        BottomSafeArea(height: height),
      ]),
    );
  }
}

class SliverTopSafeArea extends StatelessWidget {
  final double height;

  const SliverTopSafeArea({
    this.height = 10,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        TopSafeArea(height: height),
      ]),
    );
  }
}
