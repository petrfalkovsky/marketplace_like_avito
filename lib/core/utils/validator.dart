import 'package:flutter/services.dart';

abstract class StringValidator {
  bool isValid(String value);
}

class RegexValidator implements StringValidator {
  final String regexSource;

  RegExp _regex;
  RegexValidator({required this.regexSource}) : _regex = RegExp(regexSource);

  /// value: the input string
  /// returns: true if the input string is a full match for regexSource
  bool isValid(String value) {
    try {
      final matches = _regex.allMatches(value);
      for (final match in matches) {
        if (match.start == 0 && match.end == value.length) {
          return true;
        }
      }
      return false;
    } catch (e) {
      // Invalid regex
      assert(false, e.toString());
      return true;
    }
  }
}

class ValidatorInputFormatter implements TextInputFormatter {
  final StringValidator editingValidator;

  ValidatorInputFormatter({
    required this.editingValidator,
  });

  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final oldValueValid = editingValidator.isValid(oldValue.text);
    final newValueValid = editingValidator.isValid(newValue.text);
    if (oldValueValid && !newValueValid) {
      return oldValue;
    }
    return newValue;
  }
}

class ReplaceInputFormatter implements TextInputFormatter {
  final Pattern from;
  final String replace;
  ReplaceInputFormatter({required this.from, required this.replace});

  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var newString = newValue.text.replaceAll(from, replace);
    return newValue.copyWith(text: newString);
  }
}

class LeadingZeroWithDotInputFormatter implements TextInputFormatter {
  final regexValidator = RegexValidator(regexSource: '^0[1-9]+');

  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var newString = newValue.text;
    if (newString.startsWith('.')) {
      newString = '0$newString';
    } else if (regexValidator.isValid(newString)) {
      newString = newString.substring(1);
    } else {
      return newValue;
    }
    return newValue.copyWith(
      text: newString,
      selection: TextSelection.collapsed(
        offset: newString.length,
      ),
    );
  }
}

//validators

class DecimalNumberEditingRegexValidator extends RegexValidator {
  final int? maxLength;
  DecimalNumberEditingRegexValidator({
    this.maxLength,
  }) : super(
            regexSource:
                '^\$|^(0|([1-9][0-9]{0,${maxLength == null ? '' : maxLength - 1}}))(\\.[0-9]{0,2})?\$');
}

class DecimalNumberSubmitValidator implements StringValidator {
  @override
  bool isValid(String value) {
    try {
      final number = double.parse(value);
      return number > 0.0;
    } catch (e) {
      return false;
    }
  }
}

class EmailValidator extends RegexValidator {
  EmailValidator()
      : super(
            regexSource:
                r'''^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+''');
}
