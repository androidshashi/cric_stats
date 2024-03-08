import 'package:cric_stats/core/constants/app_string.dart';
import 'package:cric_stats/core/utils/utils.dart';
import 'package:cric_stats/screens/dummy_screen.dart';
import 'package:cric_stats/screens/more_screen.dart';
import 'package:cric_stats/screens/ranking/ranking_screen.dart';
import 'package:cric_stats/view_models/bottom_navigation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Bottom navigation bar screen
class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  final tabs = const [
    DummyScreen(
      title: AppString.home,
    ),
    DummyScreen(
      title: AppString.live,
    ),
    DummyScreen(
      title: AppString.matches,
    ),
    DummyScreen(
      title: AppString.polls,
    ),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          bottomNavigationBar: _buildBottomNavigationBar(),
          body: tabs[viewModel.currentIndex],
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: gradientDecoration,
      child: BottomNavigationBar(
          onTap: (value) =>
              context.read<BottomNavigationViewModel>().setCurrentIndex(value),
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          currentIndex: context.read<BottomNavigationViewModel>().currentIndex,
          items: const [
            BottomNavigationBarItem(
                label: AppString.home, icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: AppString.live, icon: Icon(Icons.live_tv)),
            BottomNavigationBarItem(
                label: AppString.matches, icon: Icon(Icons.calendar_month)),
            BottomNavigationBarItem(
                label: AppString.polls, icon: Icon(Icons.poll)),
            BottomNavigationBarItem(
                label: AppString.more, icon: Icon(Icons.more)),
          ]),
    );
  }
}
