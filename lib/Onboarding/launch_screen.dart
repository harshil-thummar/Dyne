import 'package:dyne/Constance/constance.dart';
import 'package:flutter/material.dart';

import '../Responsive/responsive.dart';
import '../Widgets/common_button.dart';
import '../main.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (Responsive.isMobile(context))
              Image.asset(ConstanceData.dyneNewLogo, height: screenWidth / 2),
            if (!Responsive.isMobile(context))
              Image.asset(ConstanceData.dyneNewLogo, height: screenWidth / 5),
            SizedBox(height: screenHeight / 12),
            SplashIcon(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, Routes.introductionScreen);
                },
                size: 55,
                icon: const Icon(Icons.arrow_forward_ios_sharp, size: 30)),
          ],
        ),
      ),
    );
  }
}
