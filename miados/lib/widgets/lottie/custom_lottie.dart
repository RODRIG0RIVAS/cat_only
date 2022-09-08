import 'package:dependency/dependency.dart';
import 'package:flutter/material.dart';

class CustomLottie extends StatefulWidget {
  const CustomLottie({required this.asset, this.alignment, super.key});

  final String asset;
  final Alignment? alignment;

  @override
  State<CustomLottie> createState() => _CustomLottieState();
}

class _CustomLottieState extends State<CustomLottie> {
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(widget.asset,
        alignment: widget.alignment, frameRate: FrameRate(60.0),
        frameBuilder: (context, widget, lottieComposition) {
      if (isLoaded) {
        return widget;
      }
      return const CircularProgressIndicator();
    }, onLoaded: (lottieComposition) {
      setState(() {
        isLoaded = true;
      });
    });
  }
}
