// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'Constance/constance.dart' as constance;
import 'Constance/constance.dart';
import 'Constance/theme.dart';
import 'Onboarding/create_account.dart';
import 'Onboarding/introduction_screen.dart';
import 'Onboarding/launch_screen.dart';
import 'Onboarding/permissions_request.dart';
import 'Onboarding/singin_singup.dart';
import 'Splash/spash_screen.dart';
import 'Widgets/costome_bottombar.dart';

late Box prefs;
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static setCustomeTheme(BuildContext context, int index) {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setCustomeTheme(index);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  setCustomeTheme(int index) {
    if (index == 6) {
      setState(() {
        AppTheme.isLightTheme = true;
      });
    } else if (index == 7) {
      setState(() {
        AppTheme.isLightTheme = false;
      });
    } else {
      setState(() {
        constance.colorsIndex = index;
        primaryColorString = ConstanceData().colors[colorsIndex];
        constance.secondaryColorString = constance.primaryColorString;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1)).then(
        (value) => SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  AppTheme.isLightTheme ? Brightness.dark : Brightness.light,
              statusBarBrightness:
                  AppTheme.isLightTheme ? Brightness.light : Brightness.dark,
              systemNavigationBarColor: Colors.black,
              systemNavigationBarDividerColor: Colors.grey,
              systemNavigationBarIconBrightness:
                  AppTheme.isLightTheme ? Brightness.dark : Brightness.light,
            )));
    return MaterialApp(
      scrollBehavior: ScrollBehavior(
          androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
      theme: AppTheme.getTheme(),
      navigatorKey: NavKey.navKey,
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }

  var routes = <String, WidgetBuilder>{
    Routes.splash: (BuildContext context) => SplashScreen(),
    Routes.launchScreen: (BuildContext context) => LaunchScreen(),
    Routes.introductionScreen: (BuildContext context) => IntroductionScreen(),
    Routes.permissionsRequest: (BuildContext context) => PermissionsRequest(),
    Routes.singinsingup: (BuildContext context) => SingInSingUp(),
    Routes.createAccount: (BuildContext context) => CreateAccount(),
    /* Routes.appearance: (BuildContext context) => AppearanceScreen(), */
    Routes.costomeBottomBar: (BuildContext context) => CustomBottomBar(),

    // Routes.costomeBottomBar: (BuildContext context) => OpenDrawer(),
    // Routes.home: (BuildContext context) => Home(),
  };
}

class Routes {
  static String splash = "/";
  static String launchScreen = "/Onboarding/launch_screen";
  static String introductionScreen = "/Onboarding/introductionScreen";
  static String permissionsRequest = "/Onboarding/permissions_request";
  static String singinsingup = "/Onboarding/singin_singup";
  static String createAccount = "/Onboarding/create_account";
  /* static String appearance = "/Constance/appearance"; */
  static String costomeBottomBar = "/Widgets/costome_bottombar";
  // static String costomeBottomBar = "/Home/costome_bottombar";
  // static String home = "/Home/home";
}

class NavKey {
  static final navKey = GlobalKey<NavigatorState>();
}
