import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../index.dart';

class MyWalletsStateWidget extends StatefulWidget {
  final Function() onBackPressed;
  const MyWalletsStateWidget({Key? key, required this.onBackPressed})
      : super(key: key);

  @override
  _MyWalletsStateWidgetState createState() => _MyWalletsStateWidgetState();
}

class _MyWalletsStateWidgetState extends State<MyWalletsStateWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return CustomScrollView(
        slivers: [
          SimpleSliverAppBar(
            titleText: 'Мои кошельки',
            onBackPressed: widget.onBackPressed,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(),
            ]),
          ),
        ],
      );
    });
  }
}
