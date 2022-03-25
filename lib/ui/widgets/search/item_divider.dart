import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDivider extends StatelessWidget {
  const ItemDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(15),
        vertical: ScreenUtil().setHeight(10),
      ),
      child: Divider(
        color: greyDivider,
        thickness: ScreenUtil().setHeight(1),
      ),
    );
  }
}
