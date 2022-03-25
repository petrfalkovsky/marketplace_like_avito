import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/ui/index.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileStateWidget extends StatefulWidget {
  final String userId;
  final Function() onBackPressed;
  const UserProfileStateWidget(
      {Key? key, this.userId = '', required this.onBackPressed})
      : super(key: key);

  @override
  _UserProfileStateWidgetState createState() => _UserProfileStateWidgetState();
}

class _UserProfileStateWidgetState extends State<UserProfileStateWidget> {
  late UserProfileBloc _userProfileBloc;
  @override
  void initState() {
    super.initState();
    _userProfileBloc = BlocProvider.of<UserProfileBloc>(context);
    _userProfileBloc.add(UserProfileOpenedEvent(userId: widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
        buildWhen: (previous, current) {
      if (widget.userId != current.userInfo!.userId) return false;
      return true;
    }, builder: (context, state) {
      return CustomScrollView(
        slivers: [
          SimpleSliverAppBar(
            titleText: 'Профиль',
            onBackPressed: widget.onBackPressed,
          ),
          if (widget.userId != state.userInfo?.userId || state.userInfo == null)
            SliverFillRemaining(
              child: Center(child: AntProgressIndicator().center()),
            )
          else ...[
            SliverItemsList(
              children: [
                UserProfileInfoWidget(userInfo: state.userInfo!),
                DividerWithHeading(heading: 'Рейтинг'),
                if (state.userRaiting != null)
                  UserRatingWidget(
                    userRaiting: state.userRaiting!,
                  ),
                DividerWithHeading(heading: 'Отзывы о продавце'),
                if (state.reviewsUser != null) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(16),
                    ),
                    child: Text(
                      state.reviewsUser!.isNotEmpty
                          ? 'Отзывы от покупателей, которые влияют на рейтинг.'
                          : 'Пока нет отзывов',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: greyColor,
                        fontWeight: FontWeight.normal,
                        fontSize: ScreenUtil().setHeight(16),
                        fontFamily: 'SF Pro Display',
                      ),
                    ),
                  ),
                ],
              ],
            ),
            if (state.reviewsUser != null)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ReviewsListWidget(
                      review: state.reviewsUser![index],
                    );
                  },
                  childCount: state.reviewsUser!.length,
                ),
              ),
            SliverItemsList(
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(30),
                ),
              ],
            ),
          ],
        ],
      );
    });
  }
}
