import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../contraller/deatials_courses_controller.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../widget/view_details_in_courses_widget.dart';
import 'about_in_details_courses.dart';
import 'list_item_review_in_courses.dart';
import 'lessons_in_details_courses.dart';

class CourseDescriptionScreen extends StatelessWidget {
  final String courseId;
  final String teacherId;
  final String details;
  CourseDescriptionScreen({super.key, required this.courseId, required this.teacherId, required this.details});
  DetailsCoursesController ob = Get.put(DetailsCoursesController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Column(
      children: [
        ImageInToDetailsCourses(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                InformationInDetailsCoursesPage(courseId: courseId,),
                TabBarInDetailsCourses(ob: ob),
                    Expanded(
                      child: GetBuilder<DetailsCoursesController>(
                          init: DetailsCoursesController(),
                          builder: (controller) {
                            if( controller.numberPage ==0){
                            return  ListItemReviewInCoursess(courseId: courseId,);
                            }else if (controller.numberPage == 1){
                              return LessonsInDetailsCourses(courseId: courseId,);
                            }else if(controller.numberPage ==2 ){
                            return  AboutInDetailsCourses( details: details, teacherId: teacherId,);
                            }else{
                              return SizedBox();
                            }
                          } ),
                    ),
                //
              ],
            ),
          ),
        ),


        // SizedBox(height: 20,),
      ],
      ),
      ),
    );
  }
}
