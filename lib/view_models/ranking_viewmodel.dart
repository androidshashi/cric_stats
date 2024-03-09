import 'package:cric_stats/core/di/locator.dart';
import 'package:cric_stats/core/utils/utils.dart';
import 'package:cric_stats/models/cricket_format.dart';
import 'package:cric_stats/repositories/ranking_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:group_button/group_button.dart';
import 'package:loader_overlay/loader_overlay.dart';

class RankingViewModel extends ChangeNotifier {
  /// Ranking repo
  final _repo = getIt<RankingRepo>();

  /// Group button controllers
  final List<GroupButtonController> _groupButtonControllers = [
    GroupButtonController(selectedIndex: 0),
    GroupButtonController(selectedIndex: 0),
    GroupButtonController(selectedIndex: 0),
  ];

  /// get current selected tab group button controller
  GroupButtonController get groupButtonController =>
      _groupButtonControllers[_currentTabIndex];

  /// set Current group button index
  void setCurrentGroupButtonIndex(int index){
    groupButtonController.selectIndex(index);
    notifyListeners();
  }

  /// Current selected tab index
  int _currentTabIndex = 0;

  /// Get current selected tab index
  int get currentTabIndex => _currentTabIndex;

  /// Set the current selected tab index
  void setCurrentTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  /// ODI
  CricketFormat _odiCricketFormat = CricketFormat.empty();

  /// Test
  CricketFormat _testCricketFormat = CricketFormat.empty();

  /// T20
  CricketFormat _t20CricketFormat = CricketFormat.empty();

  /// Current cricket format data
  CricketFormat get selectedCricketFormatData {
    switch(_currentTabIndex){
      case 0: return _odiCricketFormat;
      case 1: return _testCricketFormat;
      case 2: return _t20CricketFormat;
      default: return _odiCricketFormat;
    }
  }

  /// get the data from asset
  Future<void> fetchRankingData(BuildContext context) async {
    context.loaderOverlay.show();

    final response = await _repo.fetchRankingData();

    if(context.mounted){
      context.loaderOverlay.hide();
    }
    response.fold((error) {
      showSnackBar(context: context, content: error, success: false);
    }, (model) {
      final result = model.responseData?.result;

      // set data for ODI
      _odiCricketFormat = CricketFormat(
          teams: result?.odiTeams ?? [],
          batsmen: result?.odiBatsman ?? [],
          bowlers: result?.odiBowler ?? [],
          allRounders: result?.odiAllRounder ?? []);

      // set data for Test
      _testCricketFormat = CricketFormat(
          teams: result?.testTeams ?? [],
          batsmen: result?.testBatsman ?? [],
          bowlers: result?.testBowler ?? [],
          allRounders: result?.testAllRounder ?? []);

      // set data for T20
      _t20CricketFormat = CricketFormat(
          teams: result?.t20Teams ?? [],
          batsmen: result?.t20Batsman ?? [],
          bowlers: result?.t20Bowler ?? [],
          allRounders: result?.t20AllRounder ?? []);

      // notify
      notifyListeners();

    });
  }
}
