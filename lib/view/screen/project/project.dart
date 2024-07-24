import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:learning_app/contraller/app_controller.dart';
import 'package:learning_app/core/widget/shimmer_widget.dart';

import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../../model/home/list_project_model.dart';
import 'project_details_view.dart';

class Project extends StatelessWidget {
  const Project({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GetBuilder<AppController>(
              init: AppController(),
              builder: (controller) {
                return FutureBuilder(
                    future: controller.dataApp.get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                              itemBuilder: (context, index) => InkWell(
                                onTap: (){
                                  Get.to(ViewDetailsView(appId: controller.listApp[index].id));
                                },
                                child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      elevation: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CarouselSlider(
                                              options: CarouselOptions(height: 210),
                                              items: imageAppInProject(index)),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "${controller.listApp[index]['name']}",
                                                  style: TextStyles
                                                      .font18mainColorBold,
                                                  maxLines: 1,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  '${controller.listApp[index]['details']}',
                                                  style: TextStyles.font14GreyW300,
                                                  maxLines: 4,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .only(
                                                                        bottom: 8),
                                                            child: Icon(
                                                              Icons.star,
                                                              color: ProjectColors
                                                                  .amberColor,
                                                              size: 25,
                                                            )),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Center(
                                                            child: Text(
                                                          '${controller.listApp[index]['start']}',
                                                          style: TextStyles
                                                              .font18GreyW400,
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ],
                                                    ),
                                                    Text(
                                                      "${controller.listApp[index]['price']} \$",
                                                      style: TextStyles
                                                          .font18mainColorBold,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 15,
                                  ),
                              itemCount: controller.listApp.length);
                        } else {
                          return  ShimmerWidget(widget: Card(
                            child: Container(
                              height: 300,
                            ),
                          ));
                        }
                      } else {
                        return ListView.separated(itemBuilder: (context ,index){
                          return  ShimmerWidget(widget: Card(
                            child: Container(
                              height: 300,
                            ),
                          ));
                        }, separatorBuilder: (context , index){
                          return SizedBox(height: 15,);
                        }, itemCount: 3);
                      }
                    });
              }),
        ));
  }
}
