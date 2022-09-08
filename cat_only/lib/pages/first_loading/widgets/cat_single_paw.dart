import 'dart:math';

import 'package:flutter/material.dart';
import 'package:miados/miados.dart';

class CatSinglePaw extends StatefulWidget {
  const CatSinglePaw({
    super.key,
    required this.alignment,
  });

  final Alignment alignment;

  @override
  State<CatSinglePaw> createState() => _CatSinglePawState();
}

class _CatSinglePawState extends State<CatSinglePaw> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: Transform.rotate(
        angle: pi / 2,
        child: const SizedBox(
          height: 100,
          child: CustomLottie(
            asset: 'assets/lottie/cat_paws.json',
            alignment: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
