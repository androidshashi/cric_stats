import 'package:cric_stats/data/data_sources/local_data_source.dart';
import 'package:cric_stats/models/ranking_data_model.dart';
import 'package:cric_stats/repositories/ranking_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures/fixture_reader.dart';

class MockLocalDataSource extends Mock implements LocalDataSource {}

void main() {
  late RankingRepo rankingRepo;
  late LocalDataSource localDataSource;
  late String tJson;
  String filePath = 'assets/data/data.json';

  setUp(() {
    localDataSource = MockLocalDataSource();
    rankingRepo = RankingRepoImpl(localDataSource);

    tJson = fixtures('data.json');
  });

  group('fetchRankingData', () {

    test(
        'Make sure call to loadDataFromAsset and '
        ' returns valid [Right<RankingDataModel>] when successful', () async {
      // Arrange
      // STUB
      when(() => localDataSource.loadDataFromAsset(assetPath: filePath))
          .thenAnswer((_) async => tJson);

      // act
      final result = await rankingRepo.fetchRankingData();

      // Assert
      expect(
          result,
          isInstanceOf<Right<dynamic, RankingDataModel>>());

      verify(() => localDataSource.loadDataFromAsset(assetPath: filePath))
          .called(1);

      verifyNoMoreInteractions(localDataSource);
    });


    test(
        'Make sure call to loadDataFromAsset and '
            ' returns [Left<String>] when unsuccessful', () async {
      // Arrange
      // STUB
      when(() => localDataSource.loadDataFromAsset(assetPath: filePath))
          .thenAnswer((_) async => '');

      // act
      final result = await rankingRepo.fetchRankingData();

      // Assert
      expect(
          result,
          isInstanceOf<Left<String, dynamic>>());

      verify(() => localDataSource.loadDataFromAsset(assetPath: filePath))
          .called(1);

      verifyNoMoreInteractions(localDataSource);
    });

  });
}
