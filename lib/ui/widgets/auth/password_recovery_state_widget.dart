import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class PasswordRecoveryStateWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const PasswordRecoveryStateWidget({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  Widget _midTitle({
    required BuildContext context,
    required String text,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(24),
      ),
      child: Text(
        text.tr(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 24,
          color: mainColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _midTitle(
            context: context, text: 'Восстановление пароля на Antares Market'),
        Container(
          width: ScreenUtil().setWidth(168),
          height: ScreenUtil().setHeight(152),
          child: Image.asset('assets/images/envelop-success.png'),
        ),
        Text(
          'Для того, чтобы восстановить пароль, перейдите по ссылке в письме, которое мы выслали на указанный вами электронный адрес.'
              .tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: mainColor,
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(40),
        ),
        ColoredButton(
          text: buttonText.tr(),
          width: ScreenUtil().setWidth(296),
          height: ScreenUtil().setHeight(50),
          filled: true,
          color: mainLightColor,
          textSize: 14,
          borderRadius: ScreenUtil().setWidth(10),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
