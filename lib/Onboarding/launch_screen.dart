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
    String imageLogo = ConstanceData.dyneNewLogo;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 8),
            if (Responsive.isMobile(context))
              Image.asset(imageLogo, height: screenWidth / 2),
            if (!Responsive.isMobile(context))
              Image.asset(imageLogo, height: screenWidth / 5),
            const Spacer(),
            SplashIcon(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, Routes.introductionScreen);
                },
                size: 55,
                icon: const Icon(Icons.arrow_forward_ios_sharp, size: 30)),
            const Spacer(flex: 8),
          ],
        ),
      ),
    );
  }
}
