

import 'package:cric_stats/models/player.dart';
import 'package:cric_stats/models/team.dart';

/// Holds data for a cricket format [ODI,Test,T20]
class CricketFormat {
  final List<Team> teams;
  final List<Player> batsmen;
  final List<Player> bowlers;
  final List<Player> allRounders;
  CricketFormat({required this.teams, required this.batsmen, required this.bowlers, required this.allRounders});
  factory CricketFormat.empty() => CricketFormat(teams:[], batsmen:[], bowlers:[],allRounders: []);
}