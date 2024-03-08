import 'package:cric_stats/core/constants/app_string.dart';
import 'package:cric_stats/core/utils/utils.dart';
import 'package:cric_stats/screens/cricket_format_screen.dart';
import 'package:cric_stats/view_models/ranking_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<RankingScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<RankingViewModel>().fetchRankingData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(AppString.rankings),
              bottom: _buildTabBar(),
              flexibleSpace: Container(
                decoration: gradientDecoration,
              ),
            ),
            body: const CricketFormatScreen()));
  }

  /// Tab bar
  PreferredSizeWidget _buildTabBar() {
    return TabBar(
      indicatorColor: Colors.white,
        onTap: (value) =>
            context.read<RankingViewModel>().setCurrentTabIndex(value),
        tabs: const [
          Tab(
            text: AppString.odi,
          ),
          Tab(
            text: AppString.test,
          ),
          Tab(
            text: AppString.t20,
          ),
        ]);
  }
}
