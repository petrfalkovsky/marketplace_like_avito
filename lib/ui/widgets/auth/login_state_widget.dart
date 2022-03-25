import 'package:antares_market/core/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginStateWidget extends StatelessWidget {
  final GlobalKey<FormState> loginFormKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback? onPressed;

  const LoginStateWidget({
    Key? key,
    required this.loginFormKey,
    required this.emailController,
    required this.passwordController,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LoginTitleWidget(text: 'Вход'),
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
          LoginFormField(
            text: 'Пароль'.tr(),
            icon: 'assets/icons/password_login.png',
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (password) {
              if (password == null || password.isEmpty) {
                return 'Необходимо заполнить пароль'.tr();
              }
              return null;
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),
          ColoredButton(
            text: 'Войти'.tr(),
            width: ScreenUtil().setWidth(296),
            height: ScreenUtil().setHeight(50),
            filled: true,
            color: mainLightColor,
            textSize: 14,
            borderRadius: ScreenUtil().setWidth(10),
            onPressed: () {
              if (loginFormKey.currentState!.validate()) {
                onPressed?.call();
              }
            },
          ),
        ],
      ),
    );
  }
}
