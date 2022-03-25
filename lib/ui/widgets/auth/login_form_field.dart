import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFormField extends StatelessWidget {
  final String text;
  final String icon;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final bool obscureText;

  const LoginFormField({
    Key? key,
    required this.text,
    required this.icon,
    required this.controller,
    required this.validator,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryColorOverride(
      color: nonActiveColor,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        cursorColor: nonActiveColor,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        style: TextStyle(
          fontSize: 14,
          color: mainColor,
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(
            fontSize: 14,
          ),
          prefixIcon: Image.asset(
            icon,
          ),
          prefixIconConstraints: BoxConstraints.tightFor(
            height: ScreenUtil().setWidth(26),
            width: ScreenUtil().setWidth(26),
          ),
        ),
      ),
    );
  }
}
