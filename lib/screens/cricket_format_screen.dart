import 'package:cric_stats/core/constants/app_string.dart';
import 'package:cric_stats/core/utils/utils.dart';
import 'package:cric_stats/screens/widgets/player_widget.dart';
import 'package:cric_stats/screens/widgets/team_widget.dart';
import 'package:cric_stats/view_models/ranking_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

class CricketFormatScreen extends StatelessWidget {
  const CricketFormatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RankingViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          children: [
            Gap(20.h),
            GroupButton(
                controller: viewModel.groupButtonController,
                onSelected: (value, index, isSelected) {
                  viewModel.setCurrentGroupButtonIndex(index);
                },
                options: GroupButtonOptions(
                  spacing: 5,
                    runSpacing: 5,
                    elevation: 0,
                    groupingType: GroupingType.row,
                    mainGroupAlignment: MainGroupAlignment.spaceEvenly,
                    borderRadius: BorderRadius.circular(4.r)),
                buttons: const [
                  AppString.batsmen,
                  AppString.bowlers,
                  AppString.allRounders,
                  AppString.teams
                ]),
            Gap(20.h),
            if(viewModel.groupButtonController.selectedIndex==3)
              const TeamWidget(index: 1),

            if(viewModel.groupButtonController.selectedIndex!=3)
              const PlayerWidget(index: 1),

            Expanded(child: _buildList(viewModel))
          ],
        );
      },
    );
  }

  ListView _buildList(RankingViewModel viewModel) {

    switch (viewModel.groupButtonController.selectedIndex) {
      case 0:
        return ListView.builder(
          itemBuilder: (_, index) {

            final batsman = viewModel.selectedCricketFormatData.batsmen[index];
            return PlayerWidget(
              index: index,
              playerName: batsman.playerName,
              points: batsman.points.toString(),
              rank: batsman.position.toString(),
            );
          },
          itemCount: viewModel.selectedCricketFormatData.batsmen.length,
        );

      case 1:
        return ListView.builder(
          itemBuilder: (_, index) {
            final bowler = viewModel.selectedCricketFormatData.bowlers[index];
            return PlayerWidget(
              index: index,
              playerName: bowler.playerName,
              points: bowler.points.toString(),
              rank: bowler.position.toString(),
            );
          },
          itemCount: viewModel.selectedCricketFormatData.bowlers.length,
        );

      case 2:
        return ListView.builder(
          itemBuilder: (_, index) {

            final allRounder =
                viewModel.selectedCricketFormatData.allRounders[index];
            return PlayerWidget(
              index: index,
              playerName: allRounder.playerName,
              points: allRounder.points.toString(),
              rank: allRounder.position.toString(),
            );
          },
          itemCount: viewModel.selectedCricketFormatData.allRounders.length,
        );

      case 3:
        return ListView.builder(
          itemBuilder: (_, index) {

            final team =
            viewModel.selectedCricketFormatData.teams[index];
            return TeamWidget(
              index: index,
              ratings:team.rating.toString() ,
              teamName: team.teamName,
              points: team.points.toString(),
              rank: team.position.toString(),
            );
          },
          itemCount: viewModel.selectedCricketFormatData.teams.length,
        );

      default:
        return ListView.builder(
          itemBuilder: (_, index) {

            final batsman = viewModel.selectedCricketFormatData.batsmen[index];
            return PlayerWidget(
              index: index,
              playerName: batsman.playerName,
              points: batsman.points.toString(),
              rank: batsman.position.toString(),
            );
          },
          itemCount: viewModel.selectedCricketFormatData.batsmen.length,
        );
    }
  }
}
