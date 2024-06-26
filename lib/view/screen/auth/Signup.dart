import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

// import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_app/contraller/sign_up_controller.dart';
import 'package:learning_app/core/widget/app_text_form_filed.dart';
import 'package:learning_app/core/widget/button.dart';
import 'package:learning_app/model/sign_up_model/sign_up_model.dart';

import '../../../contraller/getX.dart';
import '../../widget/signup_widget.dart';
import 'Login.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        // width: double.infinity,
        // height: double.infinity,
        // color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(children: [
                const SizedBox(height: 60),
                Center(
                  child: GetBuilder<SingUpController>(
                    init: SingUpController(),
                    builder: (controller) {
                      return Stack(
                        children: [
                          controller.selectedImage?.path == null
                              ? CircleAvatar(radius: 80,)
                              : CircleAvatar(
                                  radius: 80,
                                  backgroundColor: Colors.grey,
                                  // View Image for Variable image
                                  child: CircleAvatar(
                                    radius: 80,
                                    backgroundImage: FileImage(File(controller.selectedImage!.path)),
                                  ),
                                ),
                          Positioned(
                              bottom: -0,
                              left: 110,
                                  child: CircleAvatar(
                                    child: IconButton(
                                        onPressed: () {
                                          ImagePicker()
                                              .pickImage(source: ImageSource.gallery,
                                              imageQuality: 20
                                          )
                                              .then((value) {
                                            controller.addImageToProfile(value);
                                          });
                                          // showImagePickerOption(context , image , selectedImage);
                                        },
                                        icon: const Icon(
                                          Icons.add_a_photo,
                                        )),
                                  ))

                        ],
                      );
                    }
                  ),
                ),
              ]),
              SizedBox(
                height: 30,
              ),
              FormInSignUp(),
              GetBuilder<SingUpController>(
                // init: SingUpController(),
                builder: (controller) {
                  if (controller.isLoading == false) {
                    return MainButton(
                      name: 'انشاء حساب ',
                      onPressed: () async {
                        // print();
                        if (controller.signUpForm.currentState!.validate()) {
                          // Get.toNamed('/Login');
                          await controller.singUpController(context);
                          // print('------------------------------ ${SingUpModel.}');
                        }
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              ButtonCreateAccountInLoginScreen()
            ],
          ),
        ),
      ),
    );
  }
}
