import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSubscriptionWidget extends StatelessWidget {
  final UserSubscriptionModel userSubscription;
  final VoidCallback onPressed;

  const UserSubscriptionWidget({
    Key? key,
    required this.userSubscription,
    required this.onPressed,
  }) : super(key: key);

  //////
  /// UI
  //////

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(4)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            height: ScreenUtil().setHeight(140),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: userSubscription.avatar,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, _) => AntProgressIndicator().center(),
                  cacheManager: AppCacheManager(),
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/avatar.png'),
                ).sizedBox(
                  width: ScreenUtil().setWidth(136),
                ),
                SizedBox(width: ScreenUtil().setWidth(8)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ScreenUtil().setWidth(10)),
                    Text(
                      userSubscription.firstName +
                          ' ' +
                          userSubscription.lastName,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xbb4f4f4f),
                        fontSize: ScreenUtil().setHeight(16),
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.24,
                        fontFamily: 'SF Pro Display',
                      ),
                    ).right(),
                    Spacer(),
                    Text(
                      'Профиль'.tr(),
                      style: TextStyle(
                        color: Color(0xff0091ab),
                        fontSize: ScreenUtil().setHeight(14),
                        fontWeight: FontWeight.normal,
                      ),
                    ).right(),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                  ],
                ).expanded(),
                SizedBox(width: ScreenUtil().setHeight(8)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
