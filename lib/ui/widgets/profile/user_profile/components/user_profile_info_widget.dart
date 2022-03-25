import 'package:antares_market/dal/models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../index.dart';

class UserProfileInfoWidget extends StatelessWidget {
  final UserProfileInfoWidgetModel userInfo;
  const UserProfileInfoWidget({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(14),
        horizontal: ScreenUtil().setWidth(16),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: ScreenUtil().radius(50),
            backgroundColor: Colors.transparent,
            backgroundImage: const AssetImage('assets/images/avatar.png'),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            userInfo.userFullName,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: blackColor,
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setHeight(14),
              fontFamily: 'SF Pro Display',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16,
          ),
          if (userInfo.isVerified != null)
            Text(
              userInfo.isVerified!
                  ? 'Верифицирован'.tr()
                  : 'Не верифицирован'.tr(),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: greyColor,
                fontWeight: FontWeight.normal,
                fontSize: ScreenUtil().setHeight(14),
                fontFamily: 'SF Pro Display',
              ),
              textAlign: TextAlign.center,
            ),
          SizedBox(
            height: 16,
          ),
          if (userInfo.createdAt != null)
            Text(
              'На Antares Market c ' +
                  DateFormat.yMMMMd(
                    context.locale.languageCode,
                  ).format(
                    userInfo.createdAt ?? DateTime(0),
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: greyColor,
                fontWeight: FontWeight.normal,
                fontSize: ScreenUtil().setHeight(14),
                fontFamily: 'SF Pro Display',
              ),
              textAlign: TextAlign.center,
            ),
          SizedBox(
            height: 16,
          ),
          if (userInfo.countUserSubscribers != null)
            Text(
              userInfo.countUserSubscribers.toString() +
                  (userInfo.countUserSubscribers == 1
                      ? ' подписчик'
                      : ' подписчиков'),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: greyColor,
                fontWeight: FontWeight.normal,
                fontSize: ScreenUtil().setHeight(14),
                fontFamily: 'SF Pro Display',
              ),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
