import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/contraller/app_controller.dart';
import '../../../core/dependency_injection/dependency_injection.dart';
import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../../model/home/list_project_model.dart';
import '../../widget/home_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List listProject = [
      {"name": "مشروع توصيل طلبات مطعم", "image": "assets/images/AppFood.jpg"},
      {"name": "مشروع أدارة الملحظات", "image": "assets/images/AppNote.jpg"}
    ];
    List<Widget> listProjectWidget() {
      if(DependencyInjection.obGetApp.listApp ==0){
        DependencyInjection.obGetApp.addDataToListApp();
      }
      return [
        for (int i = 0; i < DependencyInjection.obGetApp.listApp.length; i++) ...[
          TopSclorProjectHome(listProject: DependencyInjection.obGetApp.listApp, i: i)
        ],
      ];
    }

    // List<Widget> listProjectWidget = [
    //   for (int i = 0; i < DependencyInjection.obGetApp.listApp.length; i++) ...[
    //     GetBuilder<AppController>(
    //       init: AppController(),
    //       builder: (controller)  {
    //         controller.addDataToListCourses();
    //         return TopSclorProjectHome(listProject: controller.listApp, i: i);
    //       }
    //     )
    //   ],
    // ];
    return Scaffold(
      body: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 0, vertical: 5),
        child: Column(
          children: [
            SearchInHomePage(),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                children: [
                  PackageSclorWithDetails(
                      listProjectWidget: listProjectWidget()),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        TeacherSclorWithDetails(),
                        SizedBox(
                          height: 10,
                        ),
                        CoursesSclorWithDetailsWithCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
