
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:learning_app/contraller/teacher_controller.dart';
import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../../core/widget/no_data.dart';
import '../../../core/widget/view_data_for_firebase_with_loading.dart';
import '../../widget/teacher/courses_in_teacher_details_widget.dart';


class CoursesInTeacher extends StatelessWidget {
  final String teacherId;
  const CoursesInTeacher({super.key, required this.teacherId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherController>(
      builder: (controller) {
       return  ViewDataForFireBaseWithLoading(
          future: controller.dataCourses.where('teacher_id' ,isEqualTo: teacherId).get(),
          widgetView: (snapshot){
            if( snapshot.data!.docs.length ==0){
              return NoDataWidget(title: 'لا يوجد كورسات لهذا المعلم ',);
            }else{
                return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context ,index)=>  CardCoursesInTeacherDetailsPage(index: index , snapshot: snapshot,),
                    separatorBuilder:(context ,index)=>  SizedBox(height: 10,), itemCount: snapshot.data!.docs.length
                );
              }
          },
        );
        // return FutureBuilder(
        //   future: controller.dataCourses.where('teacher_id' ,isEqualTo: 'VgZ6Sp39neyY8MWifDJO').get(),
        //   builder: (context ,snapshot) {
        //     return ListView.separated(
        //         shrinkWrap: true,
        //         physics: NeverScrollableScrollPhysics(),
        //         itemBuilder: (context ,index)=>  CardCoursesInTeacherDetailsPage(index: index , snapshot: snapshot,),
        //         separatorBuilder:(context ,index)=>  SizedBox(height: 10,), itemCount: snapshot.data!.docs.length
        //     );
        //   }
        // );
      }
    );
  }
}






