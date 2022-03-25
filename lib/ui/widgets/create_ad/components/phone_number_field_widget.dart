import 'package:antares_market/bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../index.dart';

class PhoneNumberFialdWidget extends StatefulWidget {
  final CreateAdBloc createAdBloc;
  const PhoneNumberFialdWidget({
    Key? key,
    required this.createAdBloc,
  }) : super(key: key);

  @override
  State<PhoneNumberFialdWidget> createState() => _PhoneNumberFialdWidgetState();
}

class _PhoneNumberFialdWidgetState extends State<PhoneNumberFialdWidget> {
  final focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.value = TextEditingValue(
      text: widget.createAdBloc.state.phone ?? '',
    );
    focusNode.addListener(() {
      if (!focusNode.hasFocus && _controller.text.isNotEmpty) {
        widget.createAdBloc.add(
          CreateAdInsertedPhoneEvent(
            phone: _controller.text,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(height: ScreenUtil().setHeight(5)),
        Center(
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            inputFormatters: [_PhoneInputHandMadeFormatter()],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: mainLightColor, width: 1.0),
              ),
              disabledBorder: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Номер телефона'.tr(),
              hintStyle: AntaresMarketTextTheme.p1_2grey3Color16w400,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: whiteColor, width: 0.0),
              ),
              errorText: widget.createAdBloc.state.phoneError?.tr(),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xffef6f63), width: 1.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xffef6f63), width: 1.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PhoneInputHandMadeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
    final initialSpecialSimbolCount = newValue.selection
        .textBefore(newValue.text)
        .replaceAll(RegExp(r'[\d]+'), '')
        .length;
    final cursorPosition = newValue.selection.start - initialSpecialSimbolCount;
    var finalCursorPosition = cursorPosition;
    final digitOnlyChars = digitOnly.split('');

    if (oldValue.selection.textInside(oldValue.text) == ' ') {
      digitOnlyChars.removeAt(cursorPosition - 1);
      finalCursorPosition -= 2;
    }

    var newString = <String>[];
    for (var i = 0; i < digitOnlyChars.length; i++) {
      if (i == 1 || i == 4 || i == 7 || i == 9) {
        newString.add(' ');
        newString.add(digitOnlyChars[i]);
        if (i <= cursorPosition) finalCursorPosition += 1;
      } else {
        newString.add(digitOnlyChars[i]);
      }
    }

    final resultString = newString.join('');

    return TextEditingValue(
      text: resultString,
      selection: TextSelection.collapsed(offset: finalCursorPosition),
    );
  }
}
