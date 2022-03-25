import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class ErrorsDialog extends StatelessWidget {
  final List<String> errors;
  final VoidCallback? onPressed;
  final String buttonText;
  final String windowText;

  const ErrorsDialog({
    Key? key,
    required this.errors,
    required this.onPressed,
    required this.buttonText,
    required this.windowText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(windowText).tr(),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: errors
            .map(
              (error) => Padding(
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(5),
                ),
                child: Text(
                  error,
                ).tr(),
              ),
            )
            .toList(),
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: Text(buttonText).tr(),
        ),
      ],
    );
  }
}
