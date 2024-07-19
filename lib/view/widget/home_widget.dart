import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/contraller/deatials_courses_controller.dart';
import 'package:learning_app/contraller/teacher_controller.dart';
import 'package:learning_app/core/dependency_injection/dependency_injection.dart';

import '../../contraller/loyout_controller.dart';
import '../../core/shared/color.dart';
import '../../core/shared/theming/text_style.dart';
import '../../core/widget/image_cache_error.dart';
import '../screen/project/project_details_view.dart';
import '../screen/teacher/view_details_in_teacher.dart';
import 'courses_widget.dart';

LayoutController obGet = Get.put(LayoutController());

class CoursesSclorWithDetailsWithCategories extends StatelessWidget {
  const CoursesSclorWithDetailsWithCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "ألدورات الاكثر شعبية",
              style: TextStyles.font18BlackW500,
            ),
            InkWell(
              onTap: () {
                obGet.changeCurrentIndex(1);
              },
              child: Text(
                'رؤية الجميع',
                style: TextStyles.font18mainColorW100,
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 30,
          child: GetBuilder<DetailsCoursesController>(
              init: DetailsCoursesController(),
              builder: (controller) {
                return FutureBuilder(
                    future: controller.dataCategories.get(),
                    builder: (context, snapshot) {
                      return ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                                alignment: Alignment.center,
                                padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: 10, vertical: 1),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.hotel_class,
                                      size: 13,
                                      color: ProjectColors.amberColor,
                                    ),
                                    Text(
                                      DependencyInjection.obGetCourses
                                          .listCategoriesCourses[index]["name"],
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ProjectColors.mainColor,
                                        width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                width: 10,
                              ),
                          itemCount: DependencyInjection
                              .obGetCourses.listCategoriesCourses.length);
                    });
              }),
        ),
        SizedBox(
          height: 15,
        ),
        GetBuilder<DetailsCoursesController>(
            init: DetailsCoursesController(),
            builder: (controller) {
              return FutureBuilder(
                  future: controller.dataCourses.get(),
                  builder: (context, snapshot) {
                    // Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
                    return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Get.bottomSheet(WidgetInBottomSheet(
                                  snapshot: snapshot,
                                  index: index,
                                ));
                              },
                              child: Container(
                                padding: EdgeInsetsDirectional.all(10),
                                decoration: BoxDecoration(
                                    color: ProjectColors.whiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                          color: ProjectColors.greyColors200,
                                          spreadRadius: 2,
                                          blurRadius: 3,
                                          offset: Offset.zero),
                                    ],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: 100,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: ImageNetworkCache(
                                            url:
                                                "${DependencyInjection.obGetCourses.listCourses[index]["image"]}"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        flex: 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '13 جزاء ',
                                                  style: TextStyles
                                                      .font18mainColorW100,
                                                ),
                                                Icon(
                                                  Icons.article,
                                                  color:
                                                      ProjectColors.mainColor,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '${DependencyInjection.obGetCourses.listCourses[index]["name"]}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyles.font18BlackW500,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "${DependencyInjection.obGetCourses.listCourses[index]["price"]}  \$",
                                                  style: TextStyles
                                                      .font18mainColorBold,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "${DependencyInjection.obGetCourses.listCourses[index]["price"]} \$",
                                                  style:
                                                      TextStyles.font18GreyW300,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Center(
                                                    child: Icon(
                                                  Icons.star,
                                                  color:
                                                      ProjectColors.amberColor,
                                                  size: 20,
                                                )),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Center(
                                                    child: Text(
                                                  '${DependencyInjection.obGetCourses.listCourses[index]["evaluation"]}',
                                                  style:
                                                      TextStyles.font18GreyW300,
                                                  textAlign: TextAlign.center,
                                                )),
                                                Container(
                                                  width: 2,
                                                  color:
                                                      ProjectColors.greyColor,
                                                  height: 15,
                                                  margin: EdgeInsetsDirectional
                                                      .symmetric(
                                                          horizontal: 10,
                                                          vertical: 2),
                                                ),
                                                Expanded(
                                                    child: Text(
                                                  '${DependencyInjection.obGetCourses.listCourses[index]["counter"]} تحميل لهذة الدورة',
                                                  style:
                                                      TextStyles.font18GreyW300,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ))
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 15,
                            ),
                        itemCount: DependencyInjection
                            .obGetCourses.listCourses.length);
                  });
            })
      ],
    );
  }
}

class TeacherSclorWithDetails extends StatelessWidget {
  const TeacherSclorWithDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "كبار المرشدين",
              style: TextStyles.font18BlackW500,
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/Teacher');
              },
              child: Text(
                'رؤية الجميع',
                style: TextStyles.font18mainColorW100,
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        GetBuilder<TeacherController>(
            init: TeacherController(),
            builder: (controller) {
              return Container(
                height: 80,
                child: FutureBuilder(
                    future: controller.dataTeachers.get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  cardItemTeacherInHome(
                                      snapshot: snapshot, index: index),
                              separatorBuilder: (context, index) => SizedBox(
                                    width: 10,
                                  ),
                              itemCount: snapshot.data!.docs.length);
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              );
            })
      ],
    );
  }
}

class cardItemTeacherInHome extends StatelessWidget {
  final snapshot;
  final int index;

  const cardItemTeacherInHome({
    super.key,
    required this.snapshot,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(ViewDetailsInTeacher(teacherId: snapshot.data!.docs[index].id,));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: ProjectColors.mainColor,
            child: CircleAvatar(
              radius: 22,
              backgroundImage:
                  NetworkImage(snapshot.data!.docs[index].data()['image']),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 50,
            alignment: Alignment.center,
            child: Text(
              snapshot.data!.docs[index].data()['name'],
              style: TextStyles.font20BlackW100,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}

class PackageSclorWithDetails extends StatelessWidget {
  const PackageSclorWithDetails({
    super.key,
    required this.listProjectWidget,
  });

  final List<Widget> listProjectWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "ألمشاريع الاكثر شعبية",
              style: TextStyles.font18BlackW500,
            ),
            InkWell(
              onTap: () {
                obGet.changeCurrentIndex(3);
              },
              child: Text(
                'رؤية الجميع',
                style: TextStyles.font18mainColorW100,
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        CarouselSlider(
            items: listProjectWidget,
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (v, d) {},
              scrollDirection: Axis.horizontal,
            )),
      ],
    );
  }
}

class SearchInHomePage extends StatelessWidget {
  const SearchInHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ProjectColors.greyColors200,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          // BoxShadow(
          //     color: Colors.grey.withOpacity(0.3),
          //     spreadRadius: 2,
          //     blurRadius: 3,
          //     offset: Offset.zero),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: Icon(
            Icons.change_circle_outlined,
            color: ProjectColors.mainColor,
          ),
          hintText: 'بحث',
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 5, color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 0, color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 0, color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}

class TopSclorProjectHome extends StatelessWidget {
  const TopSclorProjectHome({
    super.key,
    required this.listProject,
    required this.i,
  });

  final List listProject;
  final int i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(ViewDetailsView(appId: listProject[i].id));
      },
      child: Container(
        height: 200,
        child: Container(
          height: 200,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: ProjectColors.mainColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: ProjectColors.greyColors200,
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset.zero),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Opacity(
                  opacity: 0.3,
                  child: ImageNetworkCache(
                    url: "${listProject[i]['image'][0]}",
                    fit: BoxFit.contain,
                  )),
              Positioned(
                  bottom: 15,
                  right: 10,
                  child: Text(
                    '${listProject[i]['name']}',
                    style: TextStyles.font18WhiteW500,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
