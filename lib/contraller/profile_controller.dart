import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_app/core/widget/awesome_dialog.dart';

class ProfileController extends GetxController {
  CollectionReference dataUser = FirebaseFirestore.instance.collection('users');

  changeIsDark(bool value) {
    isDark = value;
    // if(isDark ==true){
    //   Get.changeTheme(ThemeData.light());
    // }else{
    //   Get.changeTheme(ThemeData.dark());
    // }
    update();
  }

  bool isLangArabic = true;
  bool isLangEng = false;
  bool isLangFrance = false;
  String nameLang = 'العربية';

  changeIsLang(String name) {
    if (name == 'er') {
      isLangArabic = true;
      isLangEng = false;
      isLangFrance = false;
      nameLang = 'العربية';
    } else if (name == 'en') {
      isLangArabic = false;
      isLangEng = true;
      isLangFrance = false;
      nameLang = 'الانجليزية';
    } else if (name == 'fr') {
      isLangArabic = false;
      isLangEng = false;
      isLangFrance = true;
      nameLang = 'الفرنسية';
    }
    update();
  }

// Edit Profile
  XFile? selectedImage;
  bool isDark = false;
  bool isLoadingEdit = false;

  Future<void> updateUser(context, username, phone) {
    isLoadingEdit = true;
    update();
    return dataUser
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'username': username, 'phone': phone}).then((value) {
      isLoadingEdit = false;
      update();
      return AwesomeDialogFunction.awesomeDialogSuccess(
          context, 'تم بنجاح', 'تم عملية تعديل المستخدم بنجاح');
    }).catchError((error) {
      isLoadingEdit = false;
      AwesomeDialogFunction.awesomeDialogError(
          context, 'خطاء', "Failed to update user: $error");
    });
  }

  addImageToProfile(image) async {
    selectedImage = await image;
    update();
  }
}
