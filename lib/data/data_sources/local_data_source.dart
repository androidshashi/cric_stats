import 'package:flutter/services.dart';

/// Contains methods for fetching data from assets
class LocalDataSource {

  /// Load json file from asset
  static Future<String> loadDataFromAsset({required String assetPath}) async {
    return await rootBundle.loadString(assetPath);
  }

  LocalDataSource._();
}
