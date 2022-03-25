import 'package:antares_market/ui/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AlertManager {
  AlertManager._();

  static bool _snackBarShown = false;

  static void showShortToast(
    String text, {
    int seconds = 2,
    String buttonText = 'Отмена',
    void Function()? onPressed,
  }) {
    if (_snackBarShown) {
      try {
        ScaffoldMessenger.of(Get.context!).removeCurrentSnackBar();
      } catch (e) {}
      _snackBarShown = false;
    }
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: Duration(seconds: seconds),
        action: onPressed != null
            ? SnackBarAction(
                label: buttonText,
                onPressed: onPressed,
              )
            : null,
      ),
    );
    _snackBarShown = true;
  }

  static Future showProgress() async {
    showDialog(
      context: Get.context!,
      useSafeArea: false,
      barrierDismissible: true,
      builder: _progressWidget,
    );
    await Future.delayed(Duration(milliseconds: 150));
  }

  static Future hideProgress() async {
    Get.back();
  }

  static void showErrorDialog({
    required List<String> errors,
  }) {
    showDialog(
      context: Get.context!,
      builder: (context) => _errorWidget(
        context,
        errors: errors,
      ),
    );
  }

  static Future<XFile?> showPickerDialog() async {
    XFile? imagePicker;
    await showDialog(
      context: Get.context!,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Cupertino Title'),
        actions: [
          TextButton(
            onPressed: () async {
              imagePicker = await ImagePicker().pickImage(
                source: ImageSource.camera,
              );
              Get.back();
            },
            child: Text('Фотоапарат'),
          ),
          TextButton(
            onPressed: () async {
              imagePicker = await ImagePicker().pickImage(
                source: ImageSource.gallery,
              );
              Get.back();
            },
            child: Text('Галерея'),
          ),
        ],
      ),
    );
    return imagePicker;
  }

  static Widget _progressWidget(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: UnconstrainedBox(
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: AntProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _errorWidget(
    BuildContext context, {
    required List<String> errors,
  }) {
    return ErrorsDialog(
      onPressed: () {
        Get.back();
      },
      errors: errors,
      windowText: 'Обратите внимание!',
      buttonText: 'Хорошо',
    );
  }
}
