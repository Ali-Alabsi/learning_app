import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
// import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_app/core/widget/app_text_form_filed.dart';
import 'package:learning_app/core/widget/button.dart';

import '../../../contraller/getX.dart';
import '../../widget/signup_widget.dart';
import 'Login.dart';

class Signup extends StatelessWidget {
  Uint8List? image;
  File? selectedIMage;
  GetXCon obGet = Get.put(GetXCon());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        // color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                  children: [
                    const SizedBox(height: 60),
                    Center(

                      child: Stack(

                        children: [
                          // image != null
                          //     ? CircleAvatar(
                          //     radius: 80,
                          //     backgroundImage: MemoryImage(image!
                          //     ))
                          //     : const
                          CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.grey,
                            // backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),

                          ),
                          Positioned(
                              bottom: -0,
                              left: 110,
                              child: CircleAvatar(
                                child: IconButton(
                                    onPressed: () {
                                      // showImagePickerOption(context , image , selectedIMage);
                                    },
                                    icon: const Icon(Icons.add_a_photo,)
                                ),
                              ))

                        ],
                      ),
                    ),

                  ]
              ),
              SizedBox(
                height: 30,
              ),
              FormInSignUp(),
              MainButton(name: 'انشاء حساب ', onPressed: () {
                if(obGet.signUpForm.currentState!.validate()){
                  Get.toNamed('/Login');
                }
              },),
              ButtonCreateAccountInLoginScreen()
            ],
          ),
        ),
      ),

    );
  }


}

