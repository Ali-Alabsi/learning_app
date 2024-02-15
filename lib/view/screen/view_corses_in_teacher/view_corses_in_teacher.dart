import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../contraller/view_teacher.dart';
import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../widget/courses_widget.dart';
import '../../widget/review_widget.dart';
import '../../widget/view_corses_in_teacher_widget.dart';
import '../teasher/teasher.dart';
import 'courses_in_teacher.dart';
import 'review_in_teacher.dart';
import 'student_in_teacher.dart';

class ViewCoursesInTeacher extends StatelessWidget {
   ViewCoursesInTeacher({super.key});
  ViewTeacherController obGet = Get.put(ViewTeacherController());
  // GlobalKey <ScaeffoldStat>scaffoldkey=GlobalKey();

  @override
  Widget build(BuildContext context) {
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
        body: ListView(children: [
          Container(
              child: Column(
                  children: [
                        Container(
                          width: double.infinity,
                          // height:500,
                          // padding: EdgeInsets.symmetric(horizontal: 0),

                          // color: Colors.green,
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.cyanAccent,
                                radius: 70,
                                backgroundImage: AssetImage("assets/images/raymond.jpg"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "ابوبكر فضل الشيباني",
                                style: TextStyles.font24BlackBold,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("مصمم واجهات ويب",
                                  style: TextStyles.font16mainColorBold),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text("9.287", style: TextStyles.font28BlackBold),
                                      Text(
                                        "تقيم",
                                        style: TextStyles.font14BlackBold,
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("22.379", style: TextStyles.font28BlackBold),
                                      Text(
                                        "شاهد هذا",
                                        style: TextStyles.font14BlackBold,
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("25", style: TextStyles.font28BlackBold),
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
                              Container(
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
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
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
                        SizedBox(height: 10,),
                        GetBuilder<ViewTeacherController>(
                    builder:(controller){
                      if(controller.i ==0){
                        return ReviewInTeacher();
                      }else if(controller.i == 1){
                        return StudentInTeacher();
                      }else{
                        return CoursesInTeacher();
                      }
                    }
                ),
          ])),
        ]));
  }
}


