import 'package:antares_market/core/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class RecoveryStateWidget extends StatelessWidget {
  final GlobalKey<FormState> recoveryFormKey;
  final TextEditingController emailController;
  final VoidCallback? onPressed;

  const RecoveryStateWidget({
    Key? key,
    required this.recoveryFormKey,
    required this.emailController,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: recoveryFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LoginTitleWidget(text: 'Забыли пароль?'),
          LoginFormField(
            text: 'Email',
            icon: 'assets/icons/email_login.png',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (email) {
              if (email == null || email.isEmpty) {
                return 'Необходимо заполнить email'.tr();
              }
              if (!EmailValidator().isValid(email)) {
                return 'Введен некорректный email'.tr();
              }
              return null;
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),
          ColoredButton(
            text: 'Продолжить'.tr(),
            width: ScreenUtil().setWidth(296),
            height: ScreenUtil().setHeight(50),
            filled: true,
            color: mainLightColor,
            textSize: 14,
            borderRadius: ScreenUtil().setWidth(10),
            onPressed: () {
              if (recoveryFormKey.currentState!.validate()) {
                onPressed?.call();
              }
            },
          ),
        ],
      ),
    );
  }
}
