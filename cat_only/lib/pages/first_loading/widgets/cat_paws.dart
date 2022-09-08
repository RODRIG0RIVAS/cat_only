// ignore_for_file: prefer_const_constructors

import 'package:cat_only/pages/first_loading/widgets/cat_single_paw.dart';
import 'package:flutter/material.dart';

class CatPaws extends StatefulWidget {
  const CatPaws({super.key});

  @override
  State<CatPaws> createState() => _CatPawsState();
}

class _CatPawsState extends State<CatPaws> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        CatSinglePaw(alignment: Alignment(-.7, 1)),
        CatSinglePaw(alignment: Alignment(0, 1)),
        CatSinglePaw(alignment: Alignment(.7, 1)),
      ],
    );
  }
}
