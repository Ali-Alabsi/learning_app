import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/contraller/app_controller.dart';
import 'package:learning_app/core/widget/image_cache_error.dart';

import '../../../core/shared/theming/text_style.dart';

class ViewDetailsView extends StatelessWidget {
  final String appId;

  const ViewDetailsView({Key? key, required this.appId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Details'),
      ),
      body: GetBuilder<AppController>(
          init: AppController(),
          builder: (controller) {
            return FutureBuilder(
                future: controller.dataApp.doc(appId).get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Card(
                            child: Container(
                                margin: EdgeInsetsDirectional.symmetric(vertical: 10),
                                height: 400,
                                width: double.infinity,
                                child: ImageNetworkCache(url: snapshot.data!['image'][0], fit: BoxFit.contain,)
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Text(
                                                snapshot.data!['name'],
                                                style: TextStyles.font18mainColorBold,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "${snapshot.data!['price']} \$",
                                            style: TextStyles.font18mainColorBold,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          '${snapshot.data!['details']}'),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: double.infinity,
                                      height: 60,
                                      child: Text(
                                        'اشتري الان',
                                        style: TextStyles.font16mainColorBold,
                                      ),
                                      alignment: AlignmentDirectional.center,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFD2C8F1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                });
          }),
    );
  }
}
