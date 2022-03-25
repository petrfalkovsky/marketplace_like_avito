import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../index.dart';

class MyRewiewsStateWidget extends StatefulWidget {
  final Function() onBackPressed;
  const MyRewiewsStateWidget({Key? key, required this.onBackPressed})
      : super(key: key);

  @override
  _MyRewiewsStateWidgetState createState() => _MyRewiewsStateWidgetState();
}

class _MyRewiewsStateWidgetState extends State<MyRewiewsStateWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return CustomScrollView(
        slivers: [
          SimpleSliverAppBar(
            titleText: 'Мои отзывы',
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
