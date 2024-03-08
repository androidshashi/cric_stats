import 'package:cric_stats/core/constants/app_string.dart';
import 'package:cric_stats/screens/more_screen.dart';
import 'package:cric_stats/screens/ranking/ranking_screen.dart';
import 'package:flutter/material.dart';

/// Bottom navigation bar screen
class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {

  final tabs = const [
    MoreScreen(),
    MoreScreen(),
    MoreScreen(),
    MoreScreen(),
    MoreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: tabs[0],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: 0,
        items: const [
      BottomNavigationBarItem(label: AppString.home, icon: Icon(Icons.home)),
      BottomNavigationBarItem(label: AppString.live, icon: Icon(Icons.live_tv)),
      BottomNavigationBarItem(
          label: AppString.matches, icon: Icon(Icons.calendar_month)),
      BottomNavigationBarItem(label: AppString.polls, icon: Icon(Icons.poll)),
      BottomNavigationBarItem(label: AppString.more, icon: Icon(Icons.more)),
    ]);
  }
}
