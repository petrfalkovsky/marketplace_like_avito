import 'package:flutter/material.dart';

bool _snackBarShown = false;

mixin StateUtilsMixin<T extends StatefulWidget> on State<T> {
  bool _initialized = false;
  Object? get args => ModalRoute.of(context)!.settings.arguments;

  @protected
  @mustCallSuper
  void didInitDependencies() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      _initialized = true;
      didInitDependencies();
    }
  }

  void showShortToast(
    BuildContext context, {
    required String text,
  }) {
    if (_snackBarShown) {
      try {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
      } catch (e) {}
      _snackBarShown = false;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: Duration(seconds: 2),
      ),
    );
    _snackBarShown = true;
  }

  void unfocusCurrent() {
    WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
  }
}
