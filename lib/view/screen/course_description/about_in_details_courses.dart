import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/dependency_injection/dependency_injection.dart';
import 'package:learning_app/core/shared/theming/text_style.dart';
import 'package:learning_app/view/widget/home_widget.dart';

import '../teacher/teacher.dart';
import '../teacher/view_details_in_teacher.dart';

class AboutInDetailsCourses extends StatelessWidget {
  final String teacherId;

  final String details;

  const AboutInDetailsCourses(
      {super.key, required this.teacherId, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(icon: Icon(Icons.home),label: "home")
      // ],),
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          // width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'المعلم',
                  style: TextStyles.font28BlackBold,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1, 1),
                              spreadRadius: 1,
                              blurRadius: 5)
                        ]),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SizedBox(
                        //   width: 107,
                        // ),
                        FutureBuilder(
                          future: DependencyInjection.obGetTeacher.dataTeachers.doc(teacherId).get(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                if (snapshot.hasData) {
                                  Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                                  return InkWell(
                                    onTap: (){
                                      Get.to(ViewDetailsInTeacher(teacherId:  snapshot.data!.id,));
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          width :80 ,
                                          height: 80,
                                          child: CircleAvatar(
                                            radius: 40,
                                            backgroundImage: NetworkImage(data['image'] ,),
                                            // maxRadius: 40,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                             data['name'],
                                              style: TextStyles.font20BlackW100,
                                            ),
                                            Text(data['work'],
                                                style: TextStyles.font20BlackW100),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Center(child: CircularProgressIndicator());
                                }
                              } else {
                                return Center(child: CircularProgressIndicator());
                              }
                            }
                        ),
                        Icon(
                          Icons.mark_unread_chat_alt_rounded,
                          size: 30,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'حول الدورة',
                  style: TextStyles.font24BlackW600,
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      details,
                      style: TextStyles.font20BlackW100,
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
