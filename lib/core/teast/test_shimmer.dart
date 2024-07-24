
import 'package:flutter/material.dart';
import 'package:learning_app/core/shared/color.dart';
import 'package:shimmer/shimmer.dart';

class TestShimmer extends StatelessWidget {
  const TestShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SizedBox(
        width: 200.0,
        height: 100.0,
        child: Shimmer.fromColors(
          baseColor: ProjectColors.greyColors200,
          highlightColor:  ProjectColors.mainColor.withOpacity(0.1),
          child: Card()
        ),
      )
    );
  }
}
