import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserRatingWidget extends StatefulWidget {
  final RatingUserModel userRaiting;
  const UserRatingWidget({
    Key? key,
    required this.userRaiting,
  }) : super(key: key);

  @override
  _UserRatingWidgetState createState() => _UserRatingWidgetState();
}

class _UserRatingWidgetState extends State<UserRatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(32),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.userRaiting.overallRating.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: greyColor,
                  fontWeight: FontWeight.normal,
                  fontSize: ScreenUtil().setHeight(16),
                  fontFamily: 'SF Pro Display',
                ),
              ),
              SizedBox(width: 10),
              StarsBuild.stars(
                needFilledStars: widget.userRaiting.overallRating,
              ),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(15)),
          Row(
            children: [
              Text(
                'На основе ${widget.userRaiting.reviewsSum} отзывов.',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: greyColor,
                  fontWeight: FontWeight.normal,
                  fontSize: ScreenUtil().setHeight(16),
                  fontFamily: 'SF Pro Display',
                ),
              ),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(20)),
          StarsBuild.ratingLine(
            needFilledStars: 1,
            totalRatingNumber: widget.userRaiting.countsStars[0],
          ),
          StarsBuild.ratingLine(
            needFilledStars: 2,
            totalRatingNumber: widget.userRaiting.countsStars[1],
          ),
          StarsBuild.ratingLine(
            needFilledStars: 3,
            totalRatingNumber: widget.userRaiting.countsStars[2],
          ),
          StarsBuild.ratingLine(
            needFilledStars: 4,
            totalRatingNumber: widget.userRaiting.countsStars[3],
          ),
          StarsBuild.ratingLine(
            needFilledStars: 5,
            totalRatingNumber: widget.userRaiting.countsStars[4],
          ),
          SizedBox(height: ScreenUtil().setHeight(20))
        ],
      ),
    );
  }
}
