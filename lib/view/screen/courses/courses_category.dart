import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:learning_app/core/shared/color.dart';
import 'package:learning_app/core/shared/theming/text_style.dart';
import 'package:learning_app/core/widget/image_cache_error.dart';

import '../../../core/dependency_injection/dependency_injection.dart';
import '../../widget/courses_widget.dart';
import 'courses.dart';

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
                itemCount: DependencyInjection
                    .obGetCourses.listCategoriesCourses.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.to(Courses(
                                categoryId:
                                    '${DependencyInjection.obGetCourses.listCategoriesCourses[index].id}',
                                categoryName: '${DependencyInjection.obGetCourses.listCategoriesCourses[index]['name']}',
                              ));
                            },
                            child: Container(
                              child: ImageNetworkCache(
                                url: '${DependencyInjection.obGetCourses.listCategoriesCourses[index]["image"]}',
                                fit: BoxFit.cover,

                              ),
                              margin: EdgeInsetsDirectional.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                            ),
                          ),
                        ),
                        Text(
                          '${DependencyInjection.obGetCourses.listCategoriesCourses[index]["name"]}',
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
