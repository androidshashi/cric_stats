import 'package:cric_stats/core/constants/app_string.dart';
import 'package:cric_stats/core/utils/utils.dart';
import 'package:cric_stats/screens/ranking/ranking_screen.dart';
import 'package:cric_stats/view_models/ranking_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {

  final normalGap = Gap(2.h);
  final sectionGap = Gap(15.h);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: Text(AppString.more.toUpperCase()),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: gradientDecoration,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _moreItemWidget(
                iconData: Icons.wine_bar_outlined, title: AppString.browseSeries),
            //Normal Gap
            normalGap,
            _moreItemWidget(
                iconData: Icons.group_outlined, title: AppString.browseTeam),
            //Normal Gap
            normalGap,
            _moreItemWidget(
                iconData: Icons.person_outlined, title: AppString.browsePlayer),


            //Section Gap
            sectionGap,
            _moreItemWidget(
              iconData: Icons.star_outline_sharp,
              title: AppString.ranking,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (BuildContext context) => RankingViewModel(),
                        child: const RankingScreen(),
                      ),
                    ));
              },
            ),
            //Normal Gap
            normalGap,
            _moreItemWidget(
                iconData: Icons.newspaper_outlined, title: AppString.news),


            //Section Gap
            sectionGap,
            _moreItemWidget(
                iconData: Icons.play_circle_outline, title: AppString.youTube),
            //Normal Gap
            normalGap,
            _moreItemWidget(
                iconData: Icons.play_circle_outline, title: AppString.instagram),
            //Normal Gap
            normalGap,
            _moreItemWidget(
                iconData: Icons.play_circle_outline, title: AppString.facebook),


            //Section Gap
            sectionGap,
            _moreItemWidget(
                iconData: Icons.star_outline, title: AppString.rateUs),
            //Normal Gap
            normalGap,
            _moreItemWidget(
                iconData: Icons.feed_outlined, title: AppString.feedback),

            //Section Gap
            sectionGap,
            _moreItemWidget(iconData: Icons.settings, title: AppString.settings),
          ],
        ),
      ),
    );
  }

  Widget _moreItemWidget(
      {required IconData iconData,
      required String title,
      VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      tileColor: Colors.white,
      leading: Icon(iconData, color: Colors.black,),
      title: Text(title, style: const TextStyle(color: Colors.black),),
    );
  }
}
