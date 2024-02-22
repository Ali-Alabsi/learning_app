import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/shared/color.dart';
import 'package:learning_app/core/shared/theming/text_style.dart';

import '../video_player/video_player.dart';

class TuitionInDetailsCourses extends StatelessWidget {
  const TuitionInDetailsCourses({super.key});

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
                    'اظهار الكل',
                    style: TextStyles.font20BlackW100,
                  ),
                  Text('124 درس', style: TextStyles.font20BlackW100),
                ],
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'انظر الدقائق',
                            style: TextStyles.font20BlackW100,
                          ),
                          Text('ثانية 1_ مقدمة', style: TextStyles.font20BlackW100),
                        ],
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context , index)=> ItemInTuition(icon: Icons.slow_motion_video_sharp, index: index,), separatorBuilder:  (context , index)=>
                        SizedBox(
                          height: 10,
                        ), itemCount: 2),


                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '60 دقائق',
                            style: TextStyles.font20BlackW100,
                          ),
                          Text('ثانية 1_ مقدمة', style: TextStyles.font20BlackW100),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.separated(
                        shrinkWrap:true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            ItemInTuition(index: index, icon: Icons.lock),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 5,
                            ),
                        itemCount: 5)
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
  final int index;
  final IconData icon;
  const ItemInTuition({
    super.key, required this.index, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(VideoApp());
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
                              '0${index+1}',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            )),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'احمد القباطي',
                            style: TextStyles.font20BlackW100,
                          ),
                          Text('مصمم واجهات انتر فيس',
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
