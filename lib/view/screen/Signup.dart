import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

// import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_app/core/widget/app_text_form_filed.dart';
import 'package:learning_app/core/widget/button.dart';

import 'Login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _PickImageState();
}
class _PickImageState extends State<Signup> {
  Uint8List? _image;
  File? selectedIMage;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width:double.infinity,
        height:double.infinity,
        // color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                  children: [
                    const SizedBox(height: 60),
                    Center(

                      child:  Stack(

                        children: [
                          _image != null
                              ? CircleAvatar(
                              radius: 80, backgroundImage: MemoryImage(_image!))
                              : const CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                          ),
                          Positioned(
                              bottom: -0,
                              left: 110,
                              child: CircleAvatar(
                                child: IconButton(

                                    onPressed: () {
                                      showImagePickerOption(context);
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
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      AppTextFormFiled(hintText: 'اسم المستخدم' ,prefixIcon: Icon(Icons.account_circle ),),
                      SizedBox(
                        height: 20,
                      ),
                      AppTextFormFiled(hintText: 'الايميل' ,prefixIcon: Icon(Icons.email ),),
                      SizedBox(
                        height: 20,
                      ),
                      AppTextFormFiled(hintText: 'كلمة المرور ' ,prefixIcon: Icon(Icons.lock ),),
                      SizedBox(
                        height: 20,
                      ),
                      AppTextFormFiled(hintText: ' رقم الهاتف' ,prefixIcon: Icon(Icons.phone ),),
                      SizedBox(
                        height: 20,
                      ),

                    ],
                  ),

                ),
              ),
              MainButton(name: 'انشاء حساب ' ,onPressed: (){},),
              ButtonCreateAccountInLoginScreen()
            ],
          ),
        ),
      ),

    );

  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue[100],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

//Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}


class ButtonCreateAccountInLoginScreen extends StatelessWidget {
  const ButtonCreateAccountInLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ' امتلك حساب ',
          style: TextStyle(color: Colors.grey),
        ),
        TextButton(
            onPressed: () {
             Get.offNamed('/Login');
            },
            child: Text('تسجيل الدخول'))
      ],
    );
  }
}