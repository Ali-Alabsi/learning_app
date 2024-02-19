import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../contraller/deatials_courses_controller.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../widget/view_details_in_courses_widget.dart';
import 'abote.dart';
import 'list_item_review_in_courses.dart';
import 'tutorials.dart';

class CourseDescriptionScreen extends StatelessWidget {
  CourseDescriptionScreen({super.key});
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
                InformationInDetailsCoursesPage(),
                TabBarInDetailsCourses(ob: ob),
                    Expanded(
                      child: GetBuilder<DetailsCoursesController>(
                          init: DetailsCoursesController(),
                          builder: (controller) {
                            if( controller.numberPage ==0){
                            return  ListItemReviewInCoursess();
                            }else if (controller.numberPage == 1){
                              return TuitionInDetailsCourses();
                            }else if(controller.numberPage ==2 ){
                            return  AboutInDetailsCourses();
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
