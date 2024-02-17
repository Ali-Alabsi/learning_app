import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/view/screen/course_description/tutorials.dart';
import 'package:learning_app/view/widget/review_widget.dart';

import '../../../core/shared/theming/text_style.dart';
import '../review.dart';
import 'abote.dart';
import 'list_item_review_in_courses.dart';

class CoursedescriptionScreen extends StatelessWidget {
  CoursedescriptionScreen({super.key});

  viewCorses ob = Get.put(viewCorses());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Column(
      // alignment: Alignment.topCenter,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
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
                Container(
                  width: double.infinity,
                  height: 80,
                  child: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      appBar: AppBar(
                        bottom: TabBar(
                            onTap: (int x) {
                              ob.change(x);
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
                ),

                // ListItemReviewInCourses(),
                ListItemReviewInCoursess(),
                // Expanded(
                //   child: GetBuilder<viewCorses>(
                //     init:viewCorses() ,
                //     builder: (coon){
                //     if(coon.x==0){
                //       return ListItemReviewInCoursess();
                //     }else if(coon.x==1){
                //       return Tutprials();
                //     }else{
                //       return Abote();
                //     }
                //
                //   },),
                // )

                //
              ],
            ),
          ),
        ),

        // SizedBox(height: 20,),
      ],
      ),
      ),
    );
  }
}

class ListItemReviewInCourses extends StatelessWidget {
  const ListItemReviewInCourses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context , index)=>ListItemReviewInCoursess(),
          separatorBuilder:(context , index)=> SizedBox(height: 10,), itemCount: 10),
    );
  }
}

class viewCorses extends GetxController {
  int x = 0;

  change(index) {
    x = index;
    update();
  }
}
