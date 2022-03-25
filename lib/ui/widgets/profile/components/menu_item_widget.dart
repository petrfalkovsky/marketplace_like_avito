import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../index.dart';

class MenuItemsWidget extends StatelessWidget {
  final String text;
  final String iconSvgPath;
  final void Function() onTap;

  const MenuItemsWidget({
    Key? key,
    required this.text,
    required this.iconSvgPath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(25),
        bottom: ScreenUtil().setHeight(10),
        top: ScreenUtil().setHeight(10),
        right: ScreenUtil().setWidth(25),
      ),
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconSvgPath,
              height: ScreenUtil().setHeight(32),
              color: Color(0xff6ADF46),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(15),
            ),
            Text(
              text.tr(),
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xff006070),
                fontWeight: FontWeight.w500,
                fontFamily: "SF Pro Display",
                fontSize: ScreenUtil().setHeight(16),
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    ).inkWell(onTap);
  }
}
