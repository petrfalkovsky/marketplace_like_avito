import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../index.dart';

class MyRequestsStateWidget extends StatefulWidget {
  final Function() onBackPressed;
  const MyRequestsStateWidget({Key? key, required this.onBackPressed})
      : super(key: key);

  @override
  _MyRequestsStateWidgetState createState() => _MyRequestsStateWidgetState();
}

class _MyRequestsStateWidgetState extends State<MyRequestsStateWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return CustomScrollView(
        slivers: [
          SimpleSliverAppBar(
            titleText: 'Мои заявки',
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
