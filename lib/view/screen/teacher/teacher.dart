import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/contraller/teacher_controller.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../widget/teacher/teacher_widget.dart';
import 'view_details_in_teacher.dart';
class Teacher extends StatelessWidget {
  const Teacher({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.cyan,
        title: Text(
          "كبار المعلمين",
          style: TextStyles.font24BlackW600,
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: GetBuilder<TeacherController>(
              init: TeacherController(),
              builder: (controller) {
                return FutureBuilder(
                    future: controller.dataTeachers.where('active',isEqualTo: true).get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                              itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Get.to(ViewDetailsInTeacher(
                                      teacherId:snapshot.data!.docs[index].id,
                                    ));
                                  },
                                  child: ItemTeachers(
                                    snapshot: snapshot,
                                    index: index,
                                  )),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 5,
                                  ),
                              itemCount: snapshot.data!.docs.length);
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    });
              })),
    );
  }
}
