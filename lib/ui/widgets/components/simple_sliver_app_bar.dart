import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimpleSliverAppBar extends StatelessWidget {
  final String titleText;
  final Function()? onBackPressed;

  const SimpleSliverAppBar({
    Key? key,
    required this.titleText,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      floating: true,
      snap: true,
      centerTitle: false,
      leading: onBackPressed != null
          ? IconButton(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(16)),
              onPressed: onBackPressed,
              icon: Icon(Icons.arrow_back_ios),
            )
          : null,
      title: Text(
        titleText.tr(),
        style: AntaresMarketTextTheme.h2mainColor24w900,
      ),
      backgroundColor: Colors.white,
      toolbarHeight: ScreenUtil().setHeight(70),
      shadowColor: Color(0x5f0092A9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(ScreenUtil().radius(20)),
        ),
      ),
      elevation: 10,
    );
  }
}
