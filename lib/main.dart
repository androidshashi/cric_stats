import 'package:cric_stats/core/constants/app_string.dart';
import 'package:cric_stats/core/di/locator.dart';
import 'package:cric_stats/screens/bottom_navigation_bar_screen.dart';
import 'package:cric_stats/view_models/bottom_navigation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  // Setup locator
  setupLocator();
  // Run App
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        builder: (BuildContext context, Widget? child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => BottomNavigationViewModel(),
              ),
            ],
            child: GlobalLoaderOverlay(
              useDefaultLoading: false,
             overlayColor: Colors.transparent,
              duration: const Duration(milliseconds: 100),
              reverseDuration: const Duration(milliseconds: 350),
              child: MaterialApp(
                title: AppString.appName,
                theme: ThemeData(
                  colorScheme:  ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: child,
              ),
            ),
          );
        },
        child: const BottomNavigationBarScreen());
  }
}



