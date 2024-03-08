import 'package:flutter/services.dart';

class LocalDataSource {

  /// Load json file from asset
  static Future<String> loadDataFromAsset({required String assetPath}) async {
    return await rootBundle.loadString(assetPath);
  }

  LocalDataSource._();
}
