import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginTitleWidget extends StatelessWidget {
  final String text;

  const LoginTitleWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(24),
      ),
      child: Text(
        text.tr(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 32,
          color: mainColor,
        ),
      ),
    );
  }
}
