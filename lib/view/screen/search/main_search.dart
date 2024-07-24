import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/shared/color.dart';
import 'package:learning_app/core/shared/controller.dart';
import 'package:learning_app/core/widget/app_text_form_filed.dart';
import 'package:learning_app/core/widget/image_cache_error.dart';
import 'package:learning_app/core/widget/view_data_for_firebase_with_loading.dart';

import '../../../contraller/search_controller.dart';
import '../../../core/shared/theming/text_style.dart';

class MainSearch extends StatelessWidget {
  const MainSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search'),
        ),
        body: GetBuilder<MySearchController>(
            init: MySearchController(),
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    AppTextFormFiled(
                      hintText: 'بحت',
                      controller: MyController.search,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'كورسات',
                              style: TextStyles.font16mainColorBold,
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(100, 50),
                                maximumSize: Size(100, 50),
                                side: BorderSide(
                                    color: ProjectColors.mainColor, width: 2)),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'معلمين',
                              style: TextStyles.font16mainColorBold,
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(100, 50),
                                maximumSize: Size(100, 50),
                                side: BorderSide(
                                    color: ProjectColors.mainColor, width: 2)),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'مشاريع',
                              style: TextStyles.font16mainColorBold,
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(100, 50),
                                maximumSize: Size(100, 50),
                                side: BorderSide(
                                    color: ProjectColors.mainColor, width: 2)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('courses')
                          .where('name', isEqualTo: 'xd')
                              .where('name', isEqualTo: 'xd' + '\uf8ff')
                              .snapshots(),
                          builder: (context, snapshot) {
                            return ListView.separated(
                                itemBuilder: (context, index) {
                                  return CardItemSearchCoursesInSearch(
                                    index: index,
                                    snapshot: snapshot,
                                  );
                                }, separatorBuilder: (context, index) {
                              return Divider(color: Colors.grey[200]);
                            }, itemCount: snapshot.data!.docs.length ?? 0);
                          }
                        )
                    )
                  ],
                ),
              );
            }
        ));
  }
}

class CardItemSearchCoursesInSearch extends StatelessWidget {
  final snapshot;
  final int index;

  const CardItemSearchCoursesInSearch({
    super.key, required this.snapshot, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50)
              ),
              child: ImageNetworkCache(
                url: snapshot.data.docs[index]['image'],
              ),
            ),
            SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(snapshot.data.docs[index]['name'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font18mainColorBold),
                  SizedBox(height: 10,),
                  Text(
                    snapshot.data.docs[index]['details'],
                    style: TextStyles.font14GreyW300,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
