import 'package:cric_stats/core/utils/utils.dart';
import 'package:cric_stats/data/data_sources/local_data_source.dart';
import 'package:cric_stats/models/ranking_data_model.dart';
import 'package:fpdart/fpdart.dart';

/// Repo for fetching ranking data
class RankingRepo {

  /// Fetch ranking data @todo improve better exception handling
  Future<Either<String, RankingDataModel>> fetchRankingData() async {
    try {
      final response = await LocalDataSource.loadDataFromAsset(
          assetPath: 'assets/data/data.json');
      final model = rankingDataModelFromJson(response);
      return Right(model);
    } catch (e) {
      debugLog("Error:$e");
      return Left(e.toString());
    }
  }
}
