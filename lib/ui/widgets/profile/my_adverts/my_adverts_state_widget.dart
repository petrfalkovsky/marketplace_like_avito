import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../index.dart';

class MyAdvertsStateWidget extends StatefulWidget {
  final Function() onBackPressed;
  const MyAdvertsStateWidget({Key? key, required this.onBackPressed})
      : super(key: key);

  @override
  _MyAdvertsStateWidgetState createState() => _MyAdvertsStateWidgetState();
}

class _MyAdvertsStateWidgetState extends State<MyAdvertsStateWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return CustomScrollView(
        slivers: [
          SimpleSliverAppBar(
            titleText: 'Мои объявления',
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
