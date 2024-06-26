import 'package:flutter/material.dart';
import '../../widget/courses_widget.dart';

class Courses extends StatelessWidget {
  final String categoryId ;
  final String categoryName;
  const Courses({Key? key, required this.categoryId, required this.categoryName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryName'),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SearchInHomePage(),
            SizedBox(
              height: 15,
            ),
            // WidgetCategoriesCourses(),
            SizedBox(height: 15,),
            PageCoursesSclorWithCategories(categoryId: categoryId),
          ],
        ),
      ),
    );
  }
}
