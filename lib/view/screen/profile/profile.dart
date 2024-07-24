import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_app/core/shared/color.dart';
import '../../../contraller/profile_controller.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../../core/widget/shimmer_widget.dart';
import '../../widget/profile/profile_widget.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) {
            return FutureBuilder(
                future: controller.dataUser
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return Container(
                        padding: EdgeInsetsDirectional.only(
                            bottom: 10, start: 25, end: 25),
                        child: Container(
                          // color: Colors.blue,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 70),
                                child: Container(
                                  padding: EdgeInsetsDirectional.only(top: 70),
                                  decoration: BoxDecoration(
                                      color: ProjectColors.whiteColor,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                            color: ProjectColors.greyColor
                                                .withOpacity(0.5),
                                            offset: Offset.zero,
                                            blurRadius: 4,
                                            spreadRadius: 4)
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        data['username'],
                                        style: TextStyles.font18BlackBold,
                                      ),
                                      Text(
                                        data['email'],
                                        style: TextStyles.font18GreyW400,
                                      ),
                                      ListItemAllInProfile(),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 0,
                                  child: ShowImageInProfile(
                                    data: data,
                                  )),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return ShimmerWidget(
                        widget: Padding(
                          padding: EdgeInsets.all(10),
                          child: Card(
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      );
                    }
                  } else {

                    return ShimmerWidget(
                      widget: Padding(
                        padding: EdgeInsets.symmetric(vertical: 60 , horizontal: 20),
                        child: Card(
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    );
                  }
                });
          }),
    );
  }
}
