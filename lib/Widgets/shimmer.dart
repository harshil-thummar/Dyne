import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Constance/constance.dart';
import '../Constance/theme.dart';

class ShimmerCustom extends StatefulWidget {
  final Widget child;
  final int widgetTime;

  const ShimmerCustom({super.key, required this.child, this.widgetTime = 5});

  @override
  State<ShimmerCustom> createState() => _ShimmerCustomState();
}

class _ShimmerCustomState extends State<ShimmerCustom> {
  @override
  void initState() {
    super.initState();
    shimmerStatus();
  }

  shimmerStatus() async {
    await Future.delayed(Duration(seconds: widget.widgetTime));
    setState(() {
      shimmerEnable = false;
    });
  }

  @override
  void dispose() {
    shimmerStatus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (shimmerEnable) {
      return Shimmer.fromColors(
        period: const Duration(milliseconds: 1000),
        baseColor: AppTheme.isLightTheme
            ? Colors.grey.shade300
            : Theme.of(context).shadowColor,
        highlightColor: Colors.white30,
        child: widget.child,
      );
    } else {
      return widget.child;
    }
  }
}
