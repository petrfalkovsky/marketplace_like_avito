import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../index.dart';

class TwoButtonsRowWidget extends StatelessWidget {
  final VoidCallback? onPressedCancel;
  final VoidCallback? onPressedContinue;
  const TwoButtonsRowWidget({
    Key? key,
    this.onPressedContinue,
    this.onPressedCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 1,
          child: ElevatedButton(
            onPressed: onPressedCancel ?? () {},
            child: Text('Отмена'.tr()),
            style: AntaresMarketButtonTheme.midleInActiveButtonTwoInRow,
          ),
        ),
        SizedBox(width: ScreenUtil().setWidth(7)),
        Flexible(
          flex: 1,
          child: ElevatedButton(
            onPressed: onPressedContinue ?? () {},
            child: Text('Продолжить'.tr()),
            style: AntaresMarketButtonTheme.midleActiveButtonTwoInRow,
          ),
        ),
      ],
    );
  }
}
