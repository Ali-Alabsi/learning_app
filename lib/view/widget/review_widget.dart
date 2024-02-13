
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../core/shared/color.dart';
import '../../core/shared/theming/text_style.dart';

class ListItemReviewInReview extends StatelessWidget {
  const ListItemReviewInReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,

          itemBuilder: (context , index){
            return   ItemReviewInReview();
          }, separatorBuilder: (context , index){
        return SizedBox(height: 10,);
      }, itemCount: 10),
    );
  }
}

class ItemReviewInReview extends StatelessWidget {
  const ItemReviewInReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 10 ,vertical: 10),
      decoration: BoxDecoration(
          color: ProjectColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 60,
              width: 60,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30)),
              child: Image.asset(
                'assets/images/AppFood.jpg',
                fit: BoxFit.cover,
              )),
          SizedBox(width: 15,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'علي نبيل علي ',
                      style: TextStyles.font16mainColorBold,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 3),
                      height: 18,
                      width: 50,
                      decoration: BoxDecoration(
                          color: ProjectColors.mainColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: ProjectColors.mainColor
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.star ,size: 13 ,color: ProjectColors.amberColor,),
                          Text('4.2' ,style: TextStyles.font14BlackBold,),
                        ],
                      ),
                    )
                  ],
                ),
                Text(
                  'هذا الكورس جيدا ويحتوي على كثير من المفاهيم المهمةوايضاء الكثير من التفاصيل فان انصح بمشاهدة هذاالكورس وشكرا.',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite , color: ProjectColors.mainColor,),
                        Text('780' ,style: TextStyles.font14GreyW300,),
                      ],
                    ),
                    Text('قبل اسبوعين')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemButtonSelectEvaluation extends StatelessWidget {
  const ItemButtonSelectEvaluation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ButtonSelectEvaluation(
            name: 'ممتاز',
            color: ProjectColors.mainColor,
          ),
          ButtonSelectEvaluation(
            name: 'جيد',
          ),
          ButtonSelectEvaluation(
            name: 'متوسط',
          ),
          ButtonSelectEvaluation(
            name: 'قليل',
          ),
        ],
      ),
    );
  }
}

class ViewStartInReview extends StatelessWidget {
  const ViewStartInReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: RatingBar.builder(
        initialRating: 3,
        minRating: 1,
        itemSize: 35,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }
}

class ButtonSelectEvaluation extends StatelessWidget {
  final String name;
  final Color? color;

  const ButtonSelectEvaluation({
    super.key,
    required this.name,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 15,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            '$name',
            style: TextStyles.font14WhiteW500,
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor:
              color ?? ProjectColors.mainColor.withOpacity(0.5),
              maximumSize: Size(100, 35),
              minimumSize: Size(100, 35),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 0),
        ),
      ],
    );
  }
}

AppBar appBarReview() {
  return AppBar(
    leading: Icon(Icons.arrow_back),
    title: Text(
      'التعليقات',
      style: TextStyles.font18BlackBold,
    ),
  );
}