import 'package:cric_stats/repositories/ranking_repo.dart';
import 'package:get_it/get_it.dart';


GetIt getIt = GetIt.instance;

void setupLocator() {

  getIt.registerSingleton(RankingRepo());

}
