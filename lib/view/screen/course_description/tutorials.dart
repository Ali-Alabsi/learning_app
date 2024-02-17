import 'package:flutter/material.dart';
import 'package:learning_app/core/shared/theming/text_style.dart';

class Tutprials extends StatelessWidget {
  const Tutprials({super.key});

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
                                  blurRadius: 2)
                            ]),
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
                                  height: 100,
                                  width: 62,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey,
                                  ),
                                  child: Center(
                                      child: Text(
                                    '01',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent),
                                  )),
                                ),

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
                              Icons.slow_motion_video_sharp,
                              color: Colors.blue,
                              size: 35,
                            ),
                            // SizedBox(
                            //   width: 107,
                            // ),
                          ],
                        )),
                    SizedBox(
                      height: 10,
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
                                  blurRadius: 2)
                            ]),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 62,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey,
                                  ),
                                  child: Center(
                                      child: Text(
                                    '02',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                    ),
                                  )),
                                ),
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
                              Icons.lock_outlined,
                              color: Colors.grey,
                              size: 35,
                            ),
                            // SizedBox(
                            //   width: 107,
                            // ),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
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
                                      blurRadius: 2)
                                ]),
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 62,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.grey,
                                      ),
                                      child: Center(
                                          child: Text(
                                        '${index+3}',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent,
                                        ),
                                      )),
                                    ),
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
                                  Icons.lock_outlined,
                                  color: Colors.grey,
                                  size: 35,
                                ),
                                // SizedBox(
                                //   width: 107,
                                // ),
                              ],
                            )),
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
