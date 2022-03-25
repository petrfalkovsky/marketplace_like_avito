import 'package:antares_market/dal/models/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../index.dart';

class ReviewsListWidget extends StatelessWidget {
  final ReviewUserModel review;
  const ReviewsListWidget({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(16),
        top: ScreenUtil().setHeight(44),
        right: ScreenUtil().setWidth(16),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
              color: grey4Color,
            ),
            constraints: BoxConstraints(
              maxWidth: ScreenUtil().setWidth(373),
              minHeight: ScreenUtil().setHeight(141),
            ),
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(20),
              top: ScreenUtil().setHeight(25),
              right: ScreenUtil().setWidth(20),
              bottom: ScreenUtil().setHeight(6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.author[0].firstName + ' ' + review.author[0].firstName,
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
                SizedBox(height: ScreenUtil().setHeight(15)),
                StarsBuild.stars(needFilledStars: review.value.toDouble()),
                SizedBox(height: ScreenUtil().setHeight(10)),
                Text(
                  'Отзыв о продавце "' +
                      review.user[0].firstName +
                      ' ' +
                      review.user[0].lastName +
                      '"',
                  style: TextStyle(
                    fontSize: ScreenUtil().setHeight(12),
                    color: grey5Color,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SFProDisplay',
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),
                Text(
                  review.comment,
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat.yMMMMd(
                        context.locale.languageCode,
                      ).format(
                        review.createdAt ?? DateTime(0),
                      ),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: ScreenUtil().setHeight(12),
                        color: grey5Color,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'SFProDisplay',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            height: ScreenUtil().setHeight(45),
            width: ScreenUtil().setWidth(45),
            top: ScreenUtil().setHeight(-22.5),
            left: ScreenUtil().setWidth(20),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: const AssetImage('assets/images/avatar.png'),
              // foregroundImage: avatarUrl != '' ? NetworkImage(avatarUrl) : null,
            ),
          ),
        ],
      ),
    );
  }
}
