
import 'package:flutter/material.dart';

import '../../../core/shared/theming/text_style.dart';
import '../teasher/teasher.dart';

class StudentInTeacher extends StatelessWidget {
  const StudentInTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context ,index)=>  ItemTeachers(),
        separatorBuilder:(context ,index)=>  SizedBox(height: 10,), itemCount: 10
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