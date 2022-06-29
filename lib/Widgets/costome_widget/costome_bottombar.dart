// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, unnecessary_this, use_key_in_widget_constructors, deprecated_member_use, unused_import, non_constant_identifier_names, unused_local_variable, unused_element, library_private_types_in_public_api

import 'dart:developer';
import 'package:animations/animations.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../../Constance/constance.dart';
import '../../Constance/theme.dart';
import '../../Home/coupons_screen.dart';
import '../../Home/explore_screen.dart';
import '../../Home/profile_screen.dart';
import '../../Home/radar_screen.dart';
import '../../Language/app_localization.dart';
import '../../Models/models.dart';
import '../../Responsive/responsive.dart';
import '../common_button.dart';

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int currentIndex = 0;
  List<Widget> currentPage = [
    ExploreScreen(),
    RadarScreen(),
    CouponsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          //Navigator.pop(context);
          Navigator.of(context).pop();
        } else {
          SystemNavigator.pop();
        }
        return true;
      },
      child: Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: GestureDetector(
          onTap: () => AppTheme.isLightTheme
              ? changeColor(context, dark)
              : changeColor(context, light),
          onLongPress: () => themeDialog(context),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Theme.of(context).iconTheme.color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (Responsive.isMobile(context)) const InfiniteText("M"),
                if (Responsive.isTablet(context)) const InfiniteText("T"),
                if (Responsive.isDesktop(context)) const InfiniteText("D"),
              ],
            ),
          ),
        ),
        body: PageTransitionSwitcher(
            transitionBuilder: (
              Widget child,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: currentPage[currentIndex]),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: bottomBarSize / 10),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                  blurRadius: 8,
                  spreadRadius: 2,
                  color: Theme.of(context).shadowColor)
            ],
          ),
          height: MediaQuery.of(context).padding.bottom + bottomBarSize,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              bottomBarData.length,
              (index) {
                return InkWell(
                  onTap: () => setState(() {
                    (currentIndex = bottomBarData[index].index);
                  }),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          switchInCurve: Curves.ease,
                          child: Image.asset(bottomBarData[index].image,
                              key: UniqueKey(),
                              height: bottomBarSize / 2.8,
                              color: currentIndex == bottomBarData[index].index
                                  ? Theme.of(context).primaryColor
                                  : disabledColor),
                        ),
                        SizedBox(height: bottomBarSize / 19),
                        AnimatedDefaultTextStyle(
                          duration: Duration(milliseconds: 1500),
                          curve: Curves.elasticOut,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontSize: bottomBarSize / 4.6,
                                  color:
                                      currentIndex == bottomBarData[index].index
                                          ? Theme.of(context).primaryColor
                                          : disabledColor),
                          child: InfiniteText(
                            bottomBarData[index].name,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
