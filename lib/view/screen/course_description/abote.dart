import 'package:flutter/material.dart';
import 'package:learning_app/core/shared/theming/text_style.dart';

class Abote extends StatelessWidget {
  const Abote({super.key});

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        // bottomNavigationBar: BottomNavigationBar(items: [
        //   BottomNavigationBarItem(icon: Icon(Icons.home),label: "home")
        // ],),
        // appBar: AppBar(),

        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مرشد',
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
                          Icon(
                            Icons.mark_unread_chat_alt_rounded,
                            size: 30,
                          ),
                          // SizedBox(
                          //   width: 107,
                          // ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
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
                              CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage('assets/images/FlutterCourse.png'),
                              ),
                            ],
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
                        'يقوم هذا المقرر بتعليم'
                            ' التصميم لتطبيقات الويب ويحتوي على'
                            ' شرح مفصل لكل مايتعلق بالتطبيقات',
                        style: TextStyles.font20BlackW100,
                      ),
                      Text(
                        'يقوم هذا المقرر بتعليم التصميم لتطبيقات الويب ويحتوي على شرح مفصل لكل مايتعلق بالتطبيقات',
                        style: TextStyles.font20BlackW100,
                      ),

                    ],

                  ),
                  Text(
                    'ادوات',
                    style: TextStyles.font24BlackW600,
                  ),

                ],
              ),
            ),

          ),
        ),


    );
  }
}
