import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../index.dart';

class TitleAdFieldWidget extends StatefulWidget {
  final TextEditingController titleAdFieldController;

  final String? errorText;

  const TitleAdFieldWidget({
    Key? key,
    required this.titleAdFieldController,
    this.errorText,
  }) : super(key: key);

  @override
  _TitleAdFieldWidgetState createState() => _TitleAdFieldWidgetState();
}

class _TitleAdFieldWidgetState extends State<TitleAdFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.titleAdFieldController,
      decoration: InputDecoration(
        labelText: 'Название объявления'.tr(),
        hintText: 'Название объявления'.tr(),
        hintStyle: AntaresMarketTextTheme.p1_2grey3Color16w400,
        errorText: widget.errorText?.tr(),
      ),
    );
  }
}
