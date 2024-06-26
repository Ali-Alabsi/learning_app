import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_app/core/widget/app_text_form_filed.dart';
import '../../../contraller/profile_controller.dart';
import '../../../core/shared/color.dart';
import '../../../core/shared/controller.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../../core/widget/button.dart';
import '../../widget/profile/profile_edit_widget.dart';
class EditProfile extends StatelessWidget {
  const EditProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل الحساب', style: TextStyles.font18BlackBold),
      ),
      body: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) {
            return FutureBuilder(
                future: controller.dataUser.doc(FirebaseAuth.instance.currentUser!.uid) .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      MyController.nameEdit.text = snapshot.data!['username'];
                      MyController.phoneEdit.text = snapshot.data!['phone'];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              EditImageInProfile(controller: controller),
                              SizedBox(
                                height: 20,
                              ),
                              AppTextFormFiled(
                                hintText: 'اسم المستخدم ',
                                prefixIcon: Icon(Icons.account_circle),
                                controller: MyController.nameEdit,
                                  noSpaceTextInputFormatter:false
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              AppTextFormFiled(
                                hintText: ' رقم الهاتف ',
                                prefixIcon: Icon(Icons.phone),
                                controller: MyController.phoneEdit,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              controller.isLoadingEdit ? CircularProgressIndicator() :MainButton(
                                name: 'تعديل الحساب',
                                onPressed: () async {
                                  await controller.updateUser(
                                      context,
                                      MyController.nameEdit.text,
                                      MyController.phoneEdit.text);
                                  Get.back();
                                },
                                margin:
                                EdgeInsetsDirectional.symmetric(horizontal: 0),
                              )
                            ],
                          ),
                        ),
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


