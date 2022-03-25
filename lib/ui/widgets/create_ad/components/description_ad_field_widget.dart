import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../index.dart';

class DescriptionAdFieldWidget extends StatelessWidget {
  final TextEditingController descriptionAdFieldController;
  final String? errorText;
  const DescriptionAdFieldWidget({
    Key? key,
    required this.descriptionAdFieldController,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: descriptionAdFieldController,
      minLines: 7,
      maxLines: 10,
      enableInteractiveSelection: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: mainLightColor, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: whiteColor,
        labelText: 'Описание'.tr(),

        alignLabelWithHint: true,
        hintText: 'Описание'.tr(),
        hintStyle: AntaresMarketTextTheme.p1_2grey3Color16w400,
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: const BorderSide(color: whiteColor, width: 0.0),
        // ),
        errorText: errorText?.tr(),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xffef6f63), width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xffef6f63),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
