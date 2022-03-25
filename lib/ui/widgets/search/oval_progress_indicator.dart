import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OvalProgressIndicator extends StatelessWidget {
  final double percent;

  const OvalProgressIndicator({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: ScreenUtil().setHeight(8),
          width: ScreenUtil().setWidth(345),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: greyDivider,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                ScreenUtil().setWidth(10),
              ),
            ),
          ),
        ),
        Positioned(
          top: ScreenUtil().setHeight(1),
          left: ScreenUtil().setWidth(1),
          child: Container(
            height: ScreenUtil().setHeight(6),
            width: ScreenUtil().setWidth((percent * 343) / 100),
            decoration: BoxDecoration(
              color: greenLightColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  ScreenUtil().setWidth(10),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
