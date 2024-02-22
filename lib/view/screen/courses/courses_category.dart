import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:learning_app/core/shared/color.dart';
import 'package:learning_app/core/shared/theming/text_style.dart';

import '../../widget/courses_widget.dart';

class CoursesCategory extends StatelessWidget {
  const CoursesCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
        child: Column(
          children: [
            SearchInHomePage(),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        InkWell(
                          onTap:(){
                            Get.toNamed('/Courses');
                          },
                          child: Container(
                            child: Image.asset(
                              'assets/images/FigmaCourses.jpg',
                              fit: BoxFit.cover,
                              height: 120,
                            ),
                            margin: EdgeInsetsDirectional.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                          ),
                        ),
                        Text(
                          'كورسات التصميم',
                          style: TextStyles.font16mainColorBold,
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
