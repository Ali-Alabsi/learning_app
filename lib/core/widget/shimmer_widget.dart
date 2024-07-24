import 'package:flutter/material.dart';
import 'package:learning_app/core/shared/color.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget widget;

  const ShimmerWidget({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Shimmer.fromColors(
            baseColor: ProjectColors.greyColors200,
            highlightColor: ProjectColors.mainColor.withOpacity(0.1),
            child: widget));
  }
}
