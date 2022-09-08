import 'package:dependency/dependency.dart';
import 'package:flutter/material.dart';

class CustomStaggeredGridTile extends StatelessWidget {
  const CustomStaggeredGridTile({
    super.key,
    required this.crossAxisCellCount,
    required this.mainAxisCellCount,
    required this.child,
  });

  final int crossAxisCellCount;
  final int mainAxisCellCount;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: crossAxisCellCount,
      mainAxisCellCount: mainAxisCellCount,
      child: child,
    );
  }
}
