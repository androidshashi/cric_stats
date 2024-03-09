import 'package:flutter/services.dart';


/// Contains methods for fetching data from assets
abstract class LocalDataSource {
  /// Load json file from asset
   Future<String> loadDataFromAsset({required String assetPath});
}


/// Contains methods for fetching data from assets
class LocalDataSourceImpl extends LocalDataSource{

   @override
  Future<String> loadDataFromAsset({required String assetPath}) async {
    return await rootBundle.loadString(assetPath);
  }

}
