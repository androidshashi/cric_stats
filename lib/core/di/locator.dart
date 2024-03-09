import 'package:cric_stats/data/data_sources/local_data_source.dart';
import 'package:cric_stats/repositories/ranking_repo.dart';
import 'package:get_it/get_it.dart';


GetIt getIt = GetIt.instance;

void setupLocator() {

  getIt.registerSingleton<LocalDataSource>(LocalDataSourceImpl());
  getIt.registerSingleton<RankingRepo>(RankingRepoImpl(getIt()));

}
