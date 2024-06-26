import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/dependency_injection/dependency_injection.dart';
import '../../core/shared/color.dart';
import '../../core/shared/theming/text_style.dart';
import '../screen/course_description/course_description_Screen.dart';

class PageCoursesSclorWithCategories extends StatelessWidget {
  final String categoryId;

  const PageCoursesSclorWithCategories({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          FutureBuilder(
              future: DependencyInjection.obGetCourses.dataCourses
                  .where('categories', isEqualTo: categoryId)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.length > 0) {
                      return ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Get.bottomSheet(WidgetInBottomSheet(
                                  snapshot: snapshot,
                                  index: index,
                                ));

                              },
                              child: CardCourses(
                                index: index,
                                snapshot: snapshot,
                              )),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 15,
                              ),
                          itemCount: snapshot.data!.docs.length);
                    } else {
                      return Text('لا يوجد كورسات في هذا القسم ');
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })
        ],
      ),
    );
  }
}

class WidgetInBottomSheet extends StatelessWidget {
  final snapshot;
  final int index;

  const WidgetInBottomSheet({
    super.key,
    required this.snapshot,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      color: ProjectColors.whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CardCourses(
            index: index,
            snapshot: snapshot,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(CourseDescriptionScreen(
                      courseId: snapshot.data!.docs[index].id,
                      details: snapshot.data!.docs[index]['details'],
                      teacherId: snapshot.data!.docs[index]['teacher_id'],
                    ))?.then((value) => (){
                      // Get.back();
                      print('ali');
                    });

                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ProjectColors.mainColor,
                      maximumSize: Size(140, 40),
                      minimumSize: Size(140, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Text(
                    'عرض التفاصيل',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font14WhiteW500,
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ProjectColors.greyColor,
                      maximumSize: Size(140, 40),
                      minimumSize: Size(140, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () { Get.back();},
                  child: Text(' الغاء', style: TextStyles.font14WhiteW500)),
            ],
          )
        ],
      ),
    );
  }
}

class CardCourses extends StatelessWidget {
  final snapshot;
  final int index;

  const CardCourses({
    super.key,
    required this.snapshot,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  snapshot.data!.docs[index].data()['image'],
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '13 جزاء ',
                        style: TextStyles.font18mainColorW100,
                      ),
                      Icon(
                        Icons.article,
                        color: ProjectColors.mainColor,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    snapshot.data!.docs[index].data()['name'],
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
                        "${snapshot.data!.docs[index].data()['price']} \$",
                        style: TextStyles.font18mainColorBold,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "80 \$",
                        style: TextStyles.font18GreyW300,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                          child: Icon(
                        Icons.star,
                        color: ProjectColors.amberColor,
                        size: 20,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Center(
                          child: Text(
                        snapshot.data!.docs[index]
                            .data()['evaluation']
                            .toString(),
                        style: TextStyles.font18GreyW300,
                        textAlign: TextAlign.center,
                      )),
                      Container(
                        width: 2,
                        color: ProjectColors.greyColor,
                        height: 15,
                        margin: EdgeInsetsDirectional.symmetric(
                            horizontal: 10, vertical: 2),
                      ),
                      Text(
                        '${snapshot.data!.docs[index].data()['counter']} تحميل لهذة الدورة',
                        style: TextStyles.font18GreyW300,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class WidgetCategoriesCourses extends StatelessWidget {
  const WidgetCategoriesCourses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.separated(
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
                      'دورات مجانية',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: ProjectColors.mainColor, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
          itemCount: 10),
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
