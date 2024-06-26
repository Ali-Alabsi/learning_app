import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/dependency_injection/dependency_injection.dart';
import 'package:learning_app/core/shared/color.dart';
import 'package:learning_app/core/shared/theming/text_style.dart';

import '../../../core/widget/awesome_dialog.dart';
import '../video_player/video_player.dart';

class LessonsInDetailsCourses extends StatelessWidget {
  final String courseId;
  const LessonsInDetailsCourses({super.key, required this.courseId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'المجانية',
                    style: TextStyles.font20BlackW100,
                  ),
                  Text('2 مقاطع', style: TextStyles.font20BlackW100),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FutureBuilder(
                        future: DependencyInjection.obGetCourses.dataCourses
                            .doc(courseId)
                            .collection('video').orderBy('video_id')
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasData) {
                              return ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    if(index ==2){
                                     return  null;
                                    }else{
                                     return ItemInTuition(
                                        icon: Icons.slow_motion_video_sharp,
                                        index: index,
                                        snapshot: snapshot, coursesId: courseId,
                                      );
                                    }
                                  },
                                  separatorBuilder: (context, index) => SizedBox(
                                    height: 10,
                                  ),
                                  itemCount: snapshot.data!.docs.length);
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }
                        ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'اضهار الكل',
                            style: TextStyles.font20BlackW100,
                          ),
                          Text('20 مقطع',
                              style: TextStyles.font20BlackW100),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                        future: DependencyInjection.obGetCourses.dataCourses
                            .doc(courseId)
                            .collection('video').orderBy('video_id')
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasData) {
                              return ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                      return ItemInTuition(
                                        icon: Icons.slow_motion_video_sharp,
                                        index: index,
                                        isPaid: true,
                                        snapshot: snapshot, coursesId: courseId,
                                      );

                                  },
                                  separatorBuilder: (context, index) => SizedBox(
                                    height: 10,
                                  ),
                                  itemCount: snapshot.data!.docs.length);
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemInTuition extends StatelessWidget {
  final String coursesId;
  final int index;
  final IconData icon;
  final bool isPaid ;
  final snapshot;
  const ItemInTuition({
    super.key,
    required this.index,
    this.isPaid =false,
    required this.icon,
    required this.snapshot,
    required this.coursesId,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(isPaid){
          AwesomeDialogFunction.awesomeDialogError(context ,'خطاء في الدفع' , 'يرجى اولاُ دفع قيمتة الكورس حتى تستطيع المشاهدة');
        }else{
          Get.to(VideoApp(urlVideo: snapshot.data!.docs[index]['video_url'], videoId: snapshot.data!.docs[index].id, coursesId: coursesId,));
        }

      },
      child: Container(
        height: 80,
        child: Card(
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // CircleAvatar(
                      //   radius: 35,
                      //   backgroundImage:
                      //   AssetImage('assets/images/FlutterCourse.png'),
                      // ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ProjectColors.greyColor300,
                        ),
                        child: Center(
                            child: Text(
                          '0${index + 1}',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.data!.docs[index]['name'],
                            style: TextStyles.font20BlackW100,
                          ),
                          Text( coursesId,
                              style: TextStyles.font20BlackW100),
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    icon,
                    color: Colors.blue,
                    size: 35,
                  ),
                  // SizedBox(
                  //   width: 107,
                  // ),
                ],
              ),
            )),
      ),
    );
  }
}
