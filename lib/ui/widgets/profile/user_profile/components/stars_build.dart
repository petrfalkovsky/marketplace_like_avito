import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarsBuild {
  static Widget ratingLine({
    required double needFilledStars,
    required int totalRatingNumber,
  }) {
    final Widget _stars = stars(needFilledStars: needFilledStars);
    return Row(
      children: <Widget>[
        _stars,
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(10),
          ),
          child: Divider(),
        )),
        Text(totalRatingNumber.toString()),
      ],
    );
  }

  static Widget stars({double needFilledStars = 0}) {
    List<Widget> _stars = [];
    for (int i = 1; i < 6; i++) {
      if (needFilledStars.ceil() >= i) {
        _stars.add(
          Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(2),
              bottom: ScreenUtil().setHeight(0),
              top: ScreenUtil().setHeight(0),
              right: ScreenUtil().setWidth(2),
            ),
            child: SvgPicture.asset(
              'assets/icons/filled_star.svg',
              height: ScreenUtil().setHeight(14),
            ),
          ),
        );
      } else {
        _stars.add(
          Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(2),
              bottom: ScreenUtil().setHeight(0),
              top: ScreenUtil().setHeight(0),
              right: ScreenUtil().setWidth(2),
            ),
            child: SvgPicture.asset(
              'assets/icons/empty_star.svg',
              height: ScreenUtil().setHeight(14),
            ),
          ),
        );
      }
    }
    return Row(
      children: _stars,
    );
  }
}
