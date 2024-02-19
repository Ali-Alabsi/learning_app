
import 'package:flutter/material.dart';

import '../../contraller/deatials_courses_controller.dart';
import '../../core/shared/theming/text_style.dart';
import '../screen/course_description/list_item_review_in_courses.dart';

class InformationInDetailsCoursesPage extends StatelessWidget {
  const InformationInDetailsCoursesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.bookmark,
              size: 30,
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
                child: Text(
                  'كورس متقدم لبرنامج الفيجماء',
                  style: TextStyles.font24BlackW600,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'ساعتين و 36 دقيقه',
                  style: TextStyles.font18BlackBold,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '4.2',
                  style: TextStyles.font24BlackBold,
                ),
                SizedBox(width: 5,),
                Icon(
                  Icons.star,
                  size: 27,
                  color: Colors.amber,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              '25',
              style: TextStyles.font24BlackBold,
            ),
            Text(
              '\$',
              style: TextStyles.font24BlackBold,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'الكورسات',
                  style: TextStyles.font14BlackBold,
                ),
                Icon(
                  Icons.book_sharp,
                  size: 20,
                  color: Colors.blue,
                )
              ],
            ),
            Row(
              children: [
                Text(
                  '1,987',
                  style: TextStyles.font14BlackBold,
                ),
                Text(
                  'مشاهده',
                  style: TextStyles.font14BlackBold,
                ),
                Icon(
                  Icons.remove_red_eye,
                  size: 20,
                  color: Colors.blue,
                )
              ],
            ),
            Row(
              children: [
                Text(
                  '2.5',
                  style: TextStyles.font14BlackBold,
                ),
                Text(
                  'ساعة',
                  style: TextStyles.font14BlackBold,
                ),
                Icon(
                  Icons.timer_rounded,
                  size: 20,
                  color: Colors.blue,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class TabBarInDetailsCourses extends StatelessWidget {
  const TabBarInDetailsCourses({
    super.key,
    required this.ob,
  });

  final DetailsCoursesController ob;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
                onTap: (int index) {
                  ob.changePage(index);
                },
                tabs: [
                  Tab(
                    child: Text('التعليقات'),
                  ),
                  Tab(
                    child: Text('الدروس'),
                  ),
                  Tab(
                    child: Text('عنا'),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

class ImageInToDetailsCourses extends StatelessWidget {
  const ImageInToDetailsCourses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      width: double.infinity,
      height: 200,
      child: Image.asset(
        'assets/images/AppFood.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}



