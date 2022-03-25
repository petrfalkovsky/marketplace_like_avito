import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutex/flutex.dart';

class CancelButtonLogo extends StatelessWidget {
  const CancelButtonLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CloseButton().sizedBox(width: 60),
        Container(
          width: ScreenUtil().setWidth(166),
          height: ScreenUtil().setHeight(32),
          child: Image.asset('assets/icons/logo.png'),
        ),
        SizedBox(width: 60),
      ],
    );
  }
}
