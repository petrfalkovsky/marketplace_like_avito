import 'package:flutter/material.dart';

class SliverItemsList extends SliverList {
  SliverItemsList({
    required List<Widget> children,
    Key? key,
  }) : super(key: key, delegate: SliverChildListDelegate(children));
}
