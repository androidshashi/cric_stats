import 'dart:isolate';

import 'package:cric_stats/core/utils/utils.dart';
import 'package:cric_stats/data/data_sources/local_data_source.dart';
import 'package:cric_stats/models/ranking_data_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class RankingRepo{
  Future<Either<String, RankingDataModel>> fetchRankingData();
}

/// Repo for fetching ranking data
class RankingRepoImpl  extends RankingRepo{
  RankingRepoImpl(this._localDataSource);
  final LocalDataSource _localDataSource;
  /// Fetch ranking data
  @override
  Future<Either<String, RankingDataModel>> fetchRankingData() async {
    try {
      final response = await _localDataSource.loadDataFromAsset(
          assetPath: 'assets/data/data.json');
      final model = await Isolate.run(() => rankingDataModelFromJson(response)) ;
      return Right(model);
    } catch (e) {
      debugLog("Reading file Error:$e");
      return Left(e.toString());
    }
  }
}
