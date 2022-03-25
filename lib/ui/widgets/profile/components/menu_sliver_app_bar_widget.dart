import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuSliverAppBarWidget extends StatelessWidget {
  final String avatarUrl;
  final String userName;

  const MenuSliverAppBarWidget({
    Key? key,
    required this.userName,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      floating: true,
      snap: true,
      centerTitle: false,
      title: Row(
        children: [
          CircleAvatar(
            radius: ScreenUtil().setWidth(24),
            backgroundColor: Colors.transparent,
            backgroundImage: const AssetImage('assets/images/avatar.png'),
            foregroundImage: avatarUrl != '' ? NetworkImage(avatarUrl) : null,
          ),
          SizedBox(width: ScreenUtil().setWidth(8)),
          Text(
            userName,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Color(0xff006070),
            ),
          ),
        ],
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
