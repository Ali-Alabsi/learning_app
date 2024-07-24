import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../../core/widget/image_cache_error.dart';
import '../../screen/course_description/course_description_Screen.dart';

class CardCoursesInTeacherDetailsPage extends StatelessWidget {
  final snapshot;
  final int index;
  const CardCoursesInTeacherDetailsPage({
    super.key, required this.snapshot, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(CourseDescriptionScreen(
          courseId: snapshot.data!.docs[index].id,
          details: snapshot.data!.docs[index]['details'],
          teacherId: snapshot.data!.docs[index]['teacher_id'],
        ))?.then((value) => (){
          // Get.back();
          print('ali');
        });
      },
      child: Container(
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
                  child: ImageNetworkCache(url: snapshot.data.docs[index].data()['image'],)
              )
              ,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      snapshot.data.docs[index].data()['name'],
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
                          "${snapshot.data.docs[index].data()['price']} \$",
                          style: TextStyles.font18mainColorBold,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${snapshot.data.docs[index].data()['price']} \$",
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
                              snapshot.data.docs[index].data()['evaluation'],
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
      ),
    );
  }
}