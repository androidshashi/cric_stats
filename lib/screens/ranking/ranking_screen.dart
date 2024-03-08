import 'package:cric_stats/core/constants/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:group_button/group_button.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<RankingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.rankings),
      ),
      body: Column(
        children: [
          GroupButton(
              options:
                  GroupButtonOptions(borderRadius: BorderRadius.circular(2.r)),
              buttons: [
                AppString.batsmen,
                AppString.bowlers,
                AppString.allRounders,
                AppString.teams
              ]),
          Gap(20.h),
          Expanded(child: _buildPlayersList())
        ],
      ),
    );
  }

  Widget _buildPlayersList() {
    return ListView.builder(
      itemBuilder: (context, index) => playerRowWidget(index),
      itemCount: 20,
    );
  }

  Widget playerRowWidget(int index,
      {String? rank, String? players, String? points}) {
    return Container(
      color: index % 2 == 0 ? Colors.grey.shade200 : Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
              child: Text(
            rank ?? AppString.rank.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge,
          )),
          Expanded(
            flex: 3,
            child: Text(players ?? AppString.players.toUpperCase()),
          ),
          Expanded(child: Text(points ?? AppString.points.toUpperCase())),
        ],
      ),
    );
  }
}
