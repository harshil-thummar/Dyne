// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// const defaultRadius = 10.0;
// const defaultPadding = 15.0;
// const defaultPageDuration = Duration(milliseconds: 500);

// var primaryColorString = const Color(0xffCB4044);
// var secondaryColorString = const Color(0xffBFBFBF);

// showToast(String? message) => Fluttertoast.showToast(
//     msg: message.toString(),
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.CENTER,
//     timeInSecForIosWeb: 10,
//     textColor: Colors.white,
//     fontSize: 16.0);

import 'package:dyne/Constance/constance.dart';
import 'package:flutter/material.dart';

class MyCustomHeader extends SliverPersistentHeaderDelegate {
  MyCustomHeader({required this.expandedHeight, required this.tabs});

  final Widget tabs;
  final double expandedHeight;

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var borderRadius =
        const BorderRadius.vertical(bottom: Radius.circular(defaultRadius * 2));
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      shadowColor: Theme.of(context).shadowColor,
      elevation: 6.0,
      borderRadius: borderRadius,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: borderRadius,
          // boxShadow: [
          //   BoxShadow(
          //       blurRadius: 15.0,
          //       color: Theme.of(context).shadowColor.withOpacity(0.6),
          //       // spreadRadius: 4,
          //       offset: Offset(0.0, 0.75)),
          // ],
        ),
        child: tabs,
      ),
    );
  }
}
