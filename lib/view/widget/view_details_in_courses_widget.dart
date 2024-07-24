import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/widget/shimmer_widget.dart';
import 'package:learning_app/view/screen/pdf/pdf_view.dart';

import '../../contraller/deatials_courses_controller.dart';
import '../../core/shared/theming/text_style.dart';
import '../../core/widget/image_cache_error.dart';
import '../screen/course_description/list_item_review_in_courses.dart';

class InformationInDetailsCoursesPage extends StatelessWidget {
  final String courseId;

  const InformationInDetailsCoursesPage({
    super.key,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsCoursesController>(
        init: DetailsCoursesController(),
        builder: (controller) {
          return FutureBuilder(
              future: controller.dataCourses.doc(courseId).get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
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
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              data['name'],
                              style: TextStyles.font20mainColorBold,
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
                                  "${data['hours_counter']}  ساعة ",
                                  style: TextStyles.font18BlackBold,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  data['evaluation'].toString(),
                                  style: TextStyles.font24BlackBold,
                                ),
                                SizedBox(
                                  width: 5,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  data['price'],
                                  style: TextStyles.font24BlackBold,
                                ),
                                Text(
                                  '\$',
                                  style: TextStyles.font24BlackBold,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(pdf_view());
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'المرجع',
                                    style: TextStyles.font14BlackBold,
                                  ),
                                  Icon(
                                    Icons.menu_book,
                                    size: 20,
                                    color: Colors.blue,
                                  )
                                ],
                              ),
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
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                } else {
                  return ShimmerWidget(
                      widget: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.bookmark,
                                size: 25,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text(
                                    'أسم الكورس',
                                    style: TextStyles.font20mainColorBold,
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
                                    "عدد ساعات الكورس",
                                    style: TextStyles.font18BlackBold,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'تقيم الكورس',
                                    style: TextStyles.font18mainColorBold,
                                  ),
                                  SizedBox(
                                    width: 5,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'سعر الكورس',
                                    style: TextStyles.font24BlackBold,
                                  ),
                                  Text(
                                    '\$',
                                    style: TextStyles.font24BlackBold,
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(pdf_view());
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'المرجع',
                                      style: TextStyles.font14BlackBold,
                                    ),
                                    SizedBox(width: 5,),
                                    Icon(
                                      Icons.menu_book,
                                      size: 20,
                                      color: Colors.blue,
                                    )
                                  ],
                                ),
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
                      )
                  );
                }
              });
        });
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
  final couresId;
  const ImageInToDetailsCourses({
    super.key, required this.couresId,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DetailsCoursesController(),
        builder: (controller) {
          return FutureBuilder(
              future: controller.dataCourses.doc(couresId).get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                        width: double.infinity,
                        height: 200,
                        child: ImageNetworkCache(
                          url: "${data['image']}",
                        ));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                } else {
                  return ShimmerWidget(
                      widget: Card(
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )),
                      width: double.infinity,
                      height: 200,
                    ),
                  ));
                }
              });
        });
  }
}
