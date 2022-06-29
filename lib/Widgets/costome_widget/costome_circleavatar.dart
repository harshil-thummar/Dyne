// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../Constance/theme.dart';
import '../../Responsive/responsive.dart';

class ProfileCircleAvatar extends StatelessWidget {
  bool shadow;
  ImageProvider image;
  EdgeInsets padding;
  Color? backgroundColor;
  ProfileCircleAvatar(
      {Key? key,
      this.shadow = false,
      required this.image,
      this.backgroundColor,
      this.padding = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth =
        MediaQuery.of(context).size.width - MediaQuery.of(context).size.width;
    double widthSize = !Responsive.isMobile(context) ? 80 : 60;
    return shadow == true
        ? Container(
            margin: padding,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: AppTheme.isLightTheme
                    ? [
                        BoxShadow(
                            blurRadius: 9,
                            color:
                                Theme.of(context).shadowColor.withOpacity(0.5),
                            offset: const Offset(0.0, 8.0))
                      ]
                    : null),
            child: stackChild(context, screenWidth, widthSize, backgroundColor))
        : stackChild(context, screenWidth, widthSize, backgroundColor);
  }

  Stack stackChild(
      BuildContext context, screenWidth, widthSize, backgroundColor) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: screenWidth + widthSize + 11,
          backgroundColor: Colors.white,
        ),
        CircleAvatar(
          radius: screenWidth + widthSize + 10,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        CircleAvatar(
          radius: screenWidth + widthSize + 3,
          backgroundColor: Colors.white,
        ),
        CircleAvatar(
          radius: screenWidth + widthSize + 2,
          backgroundColor: backgroundColor,
          backgroundImage: image,
        ),
      ],
    );
  }
}

class IconCircleAvatar extends StatelessWidget {
  bool shadow;
  Widget image;
  EdgeInsets padding;
  Color? backgroundColor;
  double widthSize;

  IconCircleAvatar(
      {Key? key,
      this.shadow = false,
      required this.image,
      this.widthSize = 30,
      this.backgroundColor,
      this.padding = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth =
        MediaQuery.of(context).size.width - MediaQuery.of(context).size.width;
    // double widthSize = !Responsive.isMobile(context) ? 80 : 60;
    return shadow == true
        ? Container(
            margin: padding,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: AppTheme.isLightTheme
                    ? [
                        BoxShadow(
                            blurRadius: 9,
                            spreadRadius: 2,
                            color:
                                Theme.of(context).shadowColor.withOpacity(0.5),
                            offset: const Offset(0.0, 8.0))
                      ]
                    : null),
            child: stackChild(context, screenWidth, widthSize, backgroundColor))
        : stackChild(context, screenWidth, widthSize, backgroundColor);
  }

  Stack stackChild(
      BuildContext context, screenWidth, widthSize, backgroundColor) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
            radius: screenWidth + widthSize + 5,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor),
        CircleAvatar(
          radius: screenWidth + widthSize,
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          child: image,
        ),
      ],
    );
  }
}
