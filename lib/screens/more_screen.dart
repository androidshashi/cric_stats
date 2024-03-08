import 'package:cric_stats/core/constants/app_string.dart';
import 'package:cric_stats/screens/ranking/ranking_screen.dart';
import 'package:cric_stats/view_models/ranking_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChangeNotifierProvider(
                        create: (BuildContext context) => RankingViewModel(),
                        child: const RankingScreen(),
                      ),
                ));
          },
          child: const Text(AppString.rankings)),
    );
  }
}
