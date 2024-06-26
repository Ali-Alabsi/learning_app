import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/contraller/teacher_controller.dart';
import '../../../core/widget/no_data.dart';
import '../../../core/widget/view_data_for_firebase_with_loading.dart';
import '../../widget/teacher/student_in_teacher_widget.dart';
class StudentInTeacher extends StatelessWidget {
  final String teacherId;
  const StudentInTeacher({super.key, required this.teacherId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherController>(
      builder: (controller) {
        return ViewDataForFireBaseWithLoading(
          future: controller.dataCoursesStudent.where('teacher_id', isEqualTo: teacherId).get(),
          widgetView: (snapshot){
            if( snapshot.data!.docs.length ==0){
              return NoDataWidget(title: 'لا يوجد طلاب لهذا المعلم ',);
            }else{
                return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context ,index)=>  ItemStudentInTeacherDetails(index: index ,snapshot: snapshot),
                    separatorBuilder:(context ,index)=>  SizedBox(height: 10,), itemCount: snapshot.data!.docs.length
                );}
          },
        );

      }
    );
  }
}

