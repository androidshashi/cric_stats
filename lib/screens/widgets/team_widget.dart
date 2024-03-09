import 'package:cric_stats/core/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Represents a team with rank, name & points
class TeamWidget extends StatelessWidget {
  const TeamWidget(
      {super.key,
      this.rank,
      this.teamName,
      this.points,
      required this.index,
      this.ratings});

  final String? rank;
  final String? teamName;
  final String? points;
  final String? ratings;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index % 2 != 0 ? Colors.grey.shade200 : Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Text(
            rank ?? AppString.rank.toUpperCase(),
            style: rank == null
                ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)
                : const TextStyle(),
          )),
          Expanded(
            child: Text(
              teamName ?? AppString.teams.toUpperCase(),
              style: teamName == null
                  ? const TextStyle(fontWeight: FontWeight.bold,fontSize: 10)
                  : const TextStyle(),
            ),
          ),

          const Spacer(),

          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                ratings ?? AppString.ratings.toUpperCase(),
                style: ratings == null
                    ? const TextStyle(fontWeight: FontWeight.bold,fontSize: 10)
                    : const TextStyle(),
              ),
            ),
          ),
          Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                            points ?? AppString.points.toUpperCase(),
                            style: points == null
                  ? const TextStyle(fontWeight: FontWeight.bold,fontSize: 10)
                  : const TextStyle(),
                          ),
              )),
        ],
      ),
    );
  }
}
