import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/widget/image_cache_error.dart';

import '../../../contraller/teacher_controller.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../screen/chat/chat.dart';
import '../../screen/teacher/courses_in_teacher.dart';
import '../../screen/teacher/review_in_teacher.dart';
import '../../screen/teacher/student_in_teacher.dart';

class TopDetailsInTeacherDetailsPage extends StatelessWidget {
  final snapshot;

  const TopDetailsInTeacherDetailsPage({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 140,
                width: 140,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(70)),
                child: ImageNetworkCache(url: snapshot.data!['image']),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                snapshot.data!['name'],
                style: TextStyles.font18mainColorBold,
              ),
              SizedBox(
                height: 5,
              ),
              Text(snapshot.data!['work'],
                  style: TextStyles.font18GreyW400
              ),
              SizedBox(
                height: 20,
              ),
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
                      Text("12", style: TextStyles.font28BlackBold),
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
        Container(
          color: Colors.white10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: 150,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("موقع الويب "),
                    ),
                    Container(
                      child: Icon(Icons.language),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Get.to(
                      ChatScreen(
                        idReceived: snapshot.data.id,
                        name: snapshot.data!['name'],
                      )
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: 150,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text("رسالة "),
                      ),
                      Container(
                        child: Icon(Icons.message),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PartInTeacherDetailsPage extends StatelessWidget {
  final String teacherId;

  const PartInTeacherDetailsPage({
    super.key,
    required this.obGet,
    required this.teacherId,
  });

  final TeacherController obGet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          // color: Colors.cyan,
          child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    onTap: (int i) {
                      obGet.changeScreen(i);
                    },
                    tabs: [
                      Tab(
                        child: Text("التعليقات"),
                      ),
                      Tab(
                        child: Text("طلاب"),
                      ),
                      Tab(
                        child: Text("الكورسات"),
                      )
                    ],
                  ),
                ),
              )),
        ),
        SizedBox(
          height: 10,
        ),
        GetBuilder<TeacherController>(builder: (controller) {
          if (controller.i == 0) {
            return ReviewInTeacher(
              teacherId: teacherId,
            );
          } else if (controller.i == 1) {
            return StudentInTeacher(
              teacherId: teacherId,
            );
          } else {
            return CoursesInTeacher(
              teacherId: teacherId,
            );
          }
        }),
      ],
    );
  }
}
