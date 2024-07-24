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
import '../../core/widget/shimmer_widget.dart';
import '../screen/courses/courses.dart';
import '../screen/project/project_details_view.dart';
import '../screen/search_corsess_and_teacher/search_teacher.dart';
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
                                child: InkWell(
                                  onTap: (){
                                    Get.to(Courses(
                                      categoryId:
                                      '${DependencyInjection.obGetCourses.listCategoriesCourses[index].id}',
                                      categoryName: '${DependencyInjection.obGetCourses.listCategoriesCourses[index]['name']}',
                                    ));
                                  },
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
                  future: controller.dataCourses
                      .where('active', isEqualTo: true)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                CardItemCoursesInHomePage(
                                  index: index,
                                  snapshot: snapshot,
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 15,
                                ),
                            itemCount: DependencyInjection
                                .obGetCourses.listCourses.length);
                      } else {
                        return Center(
                            child: ShimmerWidget(
                          widget: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Container(
                                    height: 120,
                                    width: double.infinity,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(width: 10);
                              },
                              itemCount: 10),
                        ));
                      }
                    } else {
                      return Center(
                          child: ShimmerWidget(
                        widget: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Container(
                                  height: 120,
                                  width: double.infinity,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 10);
                            },
                            itemCount: 10),
                      ));
                    }
                  });
            })
      ],
    );
  }
}

class CardItemCoursesInHomePage extends StatelessWidget {
  final int index;
  final snapshot;

  const CardItemCoursesInHomePage({
    super.key,
    required this.index,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(WidgetInBottomSheet(
          snapshot: snapshot,
          index: index,
        ));
      },
      child: Card(
        child: Container(
          padding: EdgeInsetsDirectional.all(10),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 100,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 3,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${DependencyInjection.obGetCourses.listCourses[index]["counter"]} جزاء ",
                            style: TextStyles.font18mainColorW100,
                          ),
                          Text(
                            "${DependencyInjection.obGetCourses.listCourses[index]["hours_counter"]} ساعة ",
                            style: TextStyles.font18mainColorW100,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${int.parse(DependencyInjection.obGetCourses.listCourses[index]["price"]) -int.parse(DependencyInjection.obGetCourses.listCourses[index]["discount"])}\$",
                                style: TextStyles.font18mainColorBold,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${DependencyInjection.obGetCourses.listCourses[index]["price"]}\$",
                                style: TextStyles.font18GreyW300,
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                  child: Icon(
                                    Icons.star,
                                    color: ProjectColors.amberColor,
                                    size: 23,
                                  )),
                              Center(
                                  child: Text(
                                    '${DependencyInjection.obGetCourses.listCourses[index]["evaluation"]}',
                                    style: TextStyles.font18GreyW300,
                                    textAlign: TextAlign.center,
                                  )),
                              SizedBox(
                                width: 5,
                              ),

                            ],
                          ),
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
                    future: controller.dataTeachers
                        .where('active', isEqualTo: true)
                        .get(),
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
                          return Center(
                              child: ShimmerWidget(
                            widget: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return CircleAvatar(
                                    radius: 30,
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: 10);
                                },
                                itemCount: 10),
                          ));
                        }
                      } else {
                        return Center(
                            child: ShimmerWidget(
                          widget: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return CircleAvatar(
                                  radius: 25,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(width: 10);
                              },
                              itemCount: 10),
                        ));
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
      onTap: () {
        Get.to(ViewDetailsInTeacher(
          teacherId: snapshot.data!.docs[index].id,
        ));
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
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
        ),
        SizedBox(
          height: 15,
        ),
        listProjectWidget.length == 0
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: ShimmerWidget(
                    widget: Card(
                  child: Container(
                    height: 200,
                    width: double.infinity,
                  ),
                )),
              )
            : CarouselSlider(
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
      margin: EdgeInsetsDirectional.symmetric(horizontal: 15),
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
        onTap: () {
          Get.to(SearchTeacher());
        },
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
      onTap: () {
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
