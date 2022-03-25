import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

class AssetReader {
  AssetReader._();

  static Future<String> loadAsset(String filePath) async {
    return await rootBundle.loadString(filePath, cache: false);
  }
}
