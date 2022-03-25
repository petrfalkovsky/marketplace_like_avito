import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../index.dart';

class DividerWithHeading extends StatelessWidget {
  final String heading;
  const DividerWithHeading({
    Key? key,
    required this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(
          height: 1,
          indent: 0,
          endIndent: 0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(20),
            horizontal: ScreenUtil().setWidth(16),
          ),
          child: Text(
            heading,
            style: TextStyle(
              color: mainColor,
              fontSize: 24,
              fontWeight: FontWeight.w900,
              fontFamily: 'SF Pro Display',
            ),
          ),
        ),
      ],
    );
  }
}
