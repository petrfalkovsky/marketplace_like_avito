import 'package:antares_market/core/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterStateWidget extends StatelessWidget {
  final GlobalKey<FormState> registerFormKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;
  final VoidCallback? onPressed;

  const RegisterStateWidget({
    Key? key,
    required this.registerFormKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.rePasswordController,
    this.onPressed,
  }) : super(key: key);

  Widget _title({
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
          fontSize: 32,
          color: mainColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: [
          _title(context: context, text: 'Регистрация'),
          LoginFormField(
            text: 'Имя'.tr(),
            icon: 'assets/icons/person.png',
            controller: firstNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Необходимо заполнить'.tr();
              }
              return null;
            },
          ),
          LoginFormField(
            text: 'Фамилия'.tr(),
            icon: 'assets/icons/person.png',
            controller: lastNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Необходимо заполнить'.tr();
              }
              return null;
            },
          ),
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
              if (password.length < 9) {
                return 'Пароль слишком короткий'.tr();
              }
              if (!password.contains(RegExp(r'[0-9]'), 1)) {
                return 'Пароль должен содержать как минимум одну цифру'.tr();
              }
              if (!password.contains(RegExp(r'[a-zA-z]'), 1)) {
                return 'Пароль должен содержать как минимум одну букву'.tr();
              }
              return null;
            },
          ),
          LoginFormField(
            text: 'Подтвердить пароль'.tr(),
            icon: 'assets/icons/password_login.png',
            controller: rePasswordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (password) {
              if (password == null || password.isEmpty) {
                return 'Необходимо заполнить пароль'.tr();
              }
              if (password != passwordController.text) {
                return 'Пароли не совпадают'.tr();
              }
              return null;
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),
          ColoredButton(
            text: 'Зарегистрироваться'.tr(),
            width: ScreenUtil().setWidth(296),
            height: ScreenUtil().setHeight(50),
            filled: true,
            color: mainLightColor,
            textSize: 14,
            borderRadius: ScreenUtil().setWidth(10),
            onPressed: () {
              if (registerFormKey.currentState!.validate()) {
                onPressed?.call();
              }
              FocusScope.of(context).unfocus();
            },
          ),
        ],
      ),
    );
  }
}
