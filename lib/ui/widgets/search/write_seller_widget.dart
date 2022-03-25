import 'package:antares_market/ui/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WriteSellerWidget extends StatelessWidget {
  const WriteSellerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(15),
        vertical: ScreenUtil().setHeight(8),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: ScreenUtil().setHeight(8),
              ),
              child: Text(
                'Написать продавцу'.tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: mainColor,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: ScreenUtil().setHeight(40),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            ScreenUtil().setWidth(10),
                          ),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: mainOpacityColor,
                            blurRadius: ScreenUtil().setWidth(2),
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(16),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Написать сообщение'.tr(),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              ScreenUtil().setWidth(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: ScreenUtil().setWidth(5)),
                Container(
                  width: ScreenUtil().setWidth(40),
                  height: ScreenUtil().setWidth(40),
                  decoration: BoxDecoration(
                    color: mainLightColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        ScreenUtil().setWidth(20),
                      ),
                    ),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setWidth(20),
                        ),
                      ),
                    ),
                    // todo для пети: написать функцию отправки сообщения
                    onPressed: () {},
                    child: Center(
                      child: Container(
                        height: ScreenUtil().setHeight(17),
                        child: Image.asset(
                          'assets/images/arrowUp.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
