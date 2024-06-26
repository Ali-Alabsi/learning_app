import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../contraller/teacher_controller.dart';
import '../../../core/widget/view_data_for_firebase_with_loading.dart';
import '../../widget/teacher/view_details_in_teacher_widget.dart';

class ViewDetailsInTeacher extends StatelessWidget {
  final String teacherId;

  ViewDetailsInTeacher({super.key, required this.teacherId});

  @override
  Widget build(BuildContext context) {
    TeacherController obGet = Get.put(TeacherController());
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.cyan,
          actions: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.message),
            ),
          ],
        ),
        body: GetBuilder<TeacherController>(
            init: TeacherController(),
            builder: (controller) {
              return ListView(
                children: [
                  Container(
                    height: 300,
                    child: ViewDataForFireBaseWithLoading(
                      future: controller.dataTeachers.doc(teacherId).get(),
                      widgetView: (snapshot) {
                        return ListView(children: [
                          Container(
                              child: Column(children: [
                            TopDetailsInTeacherDetailsPage(
                              snapshot: snapshot,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ])),
                        ]);
                      },
                    ),
                  ),
                  PartInTeacherDetailsPage(obGet: controller , teacherId: teacherId),
                ],
              );
            }));
  }
}
