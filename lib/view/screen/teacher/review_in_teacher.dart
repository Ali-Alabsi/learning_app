
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/contraller/teacher_controller.dart';

import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../../core/widget/no_data.dart';
import '../../../core/widget/view_data_for_firebase_with_loading.dart';
import '../../widget/teacher/review_in_teacher_widget.dart';


class ReviewInTeacher extends StatelessWidget {
  final String teacherId;

  const ReviewInTeacher({super.key, required this.teacherId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherController>(
        init: TeacherController(),
        builder: (controller) {
          return ViewDataForFireBaseWithLoading(
              future: controller.dataTeacherReview.where(
                  'teacher_id', isEqualTo: teacherId).get(),
              widgetView: (snapshot) {
                if( snapshot.data!.docs.length ==0){
                  return NoDataWidget(title: 'لا يوجد تعليقات لهذا المعلم ',);
                }else{
                return ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            ItemReviewInReviewInTeacherDetails(
                                snapshot: snapshot, index: index),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10,),
                        itemCount: snapshot.data!.docs.length
                    );}
              }
          );
        }
    );
  }

}