import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/widget/shimmer_widget.dart';
import '../../../contraller/teacher_controller.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../../core/widget/view_data_for_firebase_with_loading.dart';
import '../../widget/teacher/view_details_in_teacher_widget.dart';

class ViewDetailsInTeacher extends StatelessWidget {
  final String teacherId;

  ViewDetailsInTeacher({super.key, required this.teacherId});

  @override
  Widget build(BuildContext context) {
    TeacherController obGet = Get.put(TeacherController());
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<TeacherController>(
            init: TeacherController(),
            builder: (controller) {
              return ListView(
                children: [
                  Container(
                    height: 380,
                    child: ViewDataForFireBaseWithLoading(
                      widgetLoading: ShimmerWidget(
                        widget: Column(
                          children: [
                            CircleAvatar(radius: 60,),
                            SizedBox(height: 10,),
                            Text('اسم المعلم',style: TextStyles.font24BlackW600,),
                            Text('وظيفتة المعلم',style: TextStyles.font24BlackW600,),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text("4.1", style: TextStyles.font28BlackBold),
                                    Text(
                                      "تقيم",
                                      style: TextStyles.font14BlackBold,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("22", style: TextStyles.font28BlackBold),
                                    Text(
                                      "شاهد هذا",
                                      style: TextStyles.font14BlackBold,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("3", style: TextStyles.font28BlackBold),
                                    Text(
                                      "الكورسات",
                                      style: TextStyles.font14BlackBold,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
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
