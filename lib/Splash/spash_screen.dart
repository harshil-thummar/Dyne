// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Constance/constance.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;
  @override
  void initState() {
    myContext = context;
    _loadNextScreen();
    super.initState();
  }

  late BuildContext myContext;

  _loadNextScreen() {
    if (!mounted) return;
    checkUserStatus();
  }

  checkUserStatus() async {
    await Future.delayed(const Duration(milliseconds: 2000 /* 3000 */));
    Navigator.pushReplacementNamed(context, Routes.permissionsRequest);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              ConstanceData.animatedLoding,
              width: mediaQuery.width / 2,
              height: mediaQuery.height,
            ),
          ),
        ],
      ),
    );
  }
}
