import 'package:cric_stats/core/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Represents a player with rank, name & points
class PlayerWidget extends StatelessWidget {
  const PlayerWidget(
      {super.key, this.rank, this.playerName, this.points, required this.index});

  final String? rank;
  final String? playerName;
  final String? points;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (index % 2 != 0) ? Colors.grey.shade200 : Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: Text(
            rank ?? AppString.rank.toUpperCase(),
            style: rank == null
                ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)
                : const TextStyle(),
          )),
          Expanded(
            flex: 3,
            child: Text(
              playerName ?? AppString.players.toUpperCase(),
              style: playerName == null
                  ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)
                  : const TextStyle(),
            ),
          ),
          Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                            points ?? AppString.points.toUpperCase(),
                            style: points == null
                  ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)
                  : const TextStyle(),
                          ),
              )),
        ],
      ),
    );
  }
}
