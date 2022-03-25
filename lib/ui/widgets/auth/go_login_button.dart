import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class GoLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoLoginButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          child: Text(
            'Войти'.tr(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: mainFlatColor,
            ),
          ),
        ),
      ],
    );
  }
}
