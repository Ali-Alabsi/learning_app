
import 'package:flutter/material.dart';

import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';


class CoursesInTeacher extends StatelessWidget {
  const CoursesInTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context ,index)=>  CardCourses(),
        separatorBuilder:(context ,index)=>  SizedBox(height: 10,), itemCount: 10
    );
  }}

class CardCourses extends StatelessWidget {
  const CardCourses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(10),
      decoration: BoxDecoration(
          color: ProjectColors.whiteColor,
          boxShadow: [
            BoxShadow(
                color: ProjectColors.greyColors200,
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset.zero),
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
                height: 100,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  'assets/images/FigmaCourses.jpg',
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 5,
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '13 جزاء ',
                        style: TextStyles.font18mainColorW100,
                      ),
                      Icon(
                        Icons.article,
                        color: ProjectColors.mainColor,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'دورة مجانية لتعلم التصميم ب استخدام برنامج (Figma)',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font18BlackW500,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "50 \$",
                        style: TextStyles.font18mainColorBold,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "80 \$",
                        style: TextStyles.font18GreyW300,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                          child: Icon(
                            Icons.star,
                            color: ProjectColors.amberColor,
                            size: 20,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Center(
                          child: Text(
                            '4.7',
                            style: TextStyles.font18GreyW300,
                            textAlign: TextAlign.center,
                          )),
                      Container(
                        width: 2,
                        color: ProjectColors.greyColor,
                        height: 15,
                        margin: EdgeInsetsDirectional.symmetric(
                            horizontal: 10, vertical: 2),
                      ),
                      Text(
                        '158 تحميل لهذة الدورة',
                        style: TextStyles.font18GreyW300,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}


