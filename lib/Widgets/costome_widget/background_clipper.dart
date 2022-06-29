// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BackgroundClip extends StatelessWidget {
  final Color? color;
  final EdgeInsetsGeometry padding;
  Widget? child;
  bool backgroundWidget;
  double? containerHeight;
  double getClipSize;
  BackgroundClip(
      {super.key,
      this.backgroundWidget = false,
      this.color,
      this.padding = EdgeInsets.zero,
      this.containerHeight,
      this.getClipSize = 700.0,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundWidget == true
            ? Container(
                height: MediaQuery.of(context).size.height / 2.2,
                color: Theme.of(context).primaryColor)
            : const SizedBox(),
        Padding(
          padding: padding,
          child: Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: BackgroundClipper(height: getClipSize),
              child: Container(
                height: containerHeight,
                decoration: BoxDecoration(
                  color: color ?? Theme.of(context).scaffoldBackgroundColor,
                ),
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  double height;
  BackgroundClipper({required this.height});
  @override
  Path getClip(Size size) {
    var roundnessFactor = 15.0;
    var path = Path();
    //Bottom Part
    path.moveTo(0, size.height * 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height);
    //Top Part
    path.lineTo(size.width, roundnessFactor * 3);
    path.quadraticBezierTo(size.width, roundnessFactor,
        size.width - roundnessFactor * 2, roundnessFactor * 1.4);
    path.lineTo(roundnessFactor * 1.3, height * 0.10 - roundnessFactor * 0.5);
    path.quadraticBezierTo(
        1, height * 0.10, 0, height * 0.10 + roundnessFactor);

    //Responsive//
    /*
    path.moveTo(0, height * 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height);
    path.lineTo(size.width, roundnessFactor * 3);
    path.quadraticBezierTo(size.width, roundnessFactor,
        size.width - roundnessFactor * 2, roundnessFactor * 1.4);
    path.lineTo(
        roundnessFactor * 1.3, size.height * 0.10 - roundnessFactor * 0.5);
    path.quadraticBezierTo(
        1, size.height * 0.10, 0, size.height * 0.10 + roundnessFactor);
    */

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
