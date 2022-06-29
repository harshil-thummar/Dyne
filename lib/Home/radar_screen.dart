// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../Constance/constance.dart';
import '../Widgets/costome_widget/costome_circleavatar.dart';

class RadarScreen extends StatefulWidget {
  const RadarScreen({Key? key}) : super(key: key);

  @override
  State<RadarScreen> createState() => _RadarScreenState();
}

class _RadarScreenState extends State<RadarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          ProfileCircleAvatar(
            shadow: true,
            image: AssetImage(ConstanceData.profile),
          )
        ],
      ),
    );
  }
}
