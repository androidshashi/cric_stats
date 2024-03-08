import 'package:cric_stats/core/utils/utils.dart';
import 'package:flutter/material.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        flexibleSpace: Container(
          decoration: gradientDecoration,
        ),
      ),
    );
  }
}
