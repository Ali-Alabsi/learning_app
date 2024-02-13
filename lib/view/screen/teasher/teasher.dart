import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/view/widget/layout_widget.dart';

import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';

class Teacher extends StatelessWidget {
  const Teacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.cyan,
        title: Text(
          "كبار المعلمين",
          style: TextStyles.font24BlackW600,
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.search_rounded),
          ),
        ],
      ),
      body:
          // padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),

          Container(

              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              //   color: Colors.white10,
              width: double.infinity,
              height: double.infinity,
              child: ListView.separated(
                  itemBuilder: (context ,intdex)=>InkWell(onTap: (){Get.toNamed('/ViewCoursesInTeacher');}, child: ItemTeachers()),
                  separatorBuilder: (context ,intdex)=>SizedBox(height: 5,) , itemCount: 10)),
    );
  }
}

class ItemTeachers extends StatelessWidget {
  const ItemTeachers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.cyanAccent,
                  radius: 35,
                  backgroundImage: AssetImage("assets/images/raymond.jpg"),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("علي نبيل علي", style: TextStyles.font18BlackBold),
                    Text(
                      "مطور تطبيقات جوال",
                      style: TextStyles.font14GreyW300,
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.chat)
          ],
        ),
      ),
    );
  }
}
