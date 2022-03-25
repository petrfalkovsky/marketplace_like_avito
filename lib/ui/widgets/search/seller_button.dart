import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellerButton extends StatelessWidget {
  final String sellerName;

  const SellerButton({
    Key? key,
    required this.sellerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(15),
        vertical: ScreenUtil().setHeight(8),
      ),
      child: Container(
        height: ScreenUtil().setHeight(60),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              ScreenUtil().setWidth(10),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(16),
                    ),
                    child: Container(
                      width: ScreenUtil().setWidth(44),
                      height: ScreenUtil().setWidth(44),
                      child: Image.asset('assets/images/avatar.png'),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      sellerName,
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(16),
              ),
              child: Container(
                height: ScreenUtil().setHeight(22),
                child: Image.asset('assets/icons/chevron-left.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
