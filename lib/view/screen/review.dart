import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:learning_app/core/shared/color.dart';

import '../../core/shared/theming/text_style.dart';
import '../widget/review_widget.dart';

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarReview(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '4.5',
              style: TextStyles.font24BlackW600,
            ),
            SizedBox(height: 10,),
            ViewStartInReview(),
            SizedBox(height: 10,),
            ItemButtonSelectEvaluation(),
            SizedBox(height: 10,),
            ListItemReviewInReview()

          ],
        ),
      ),
    );
  }


}

