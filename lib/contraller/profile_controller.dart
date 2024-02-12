
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  bool isDark = false;
  changeIsDark (bool value){
    isDark =value;
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
  changeIsLang(String name ){
    if(name == 'er'){
      isLangArabic = true;
      isLangEng = false;
      isLangFrance= false;
      nameLang = 'العربية';
    }else if(name == 'en'){
      isLangArabic = false;
      isLangEng = true;
      isLangFrance= false;
      nameLang = 'الانجليزية';
    }else if( name == 'fr'){
      isLangArabic = false;
      isLangEng = false;
      isLangFrance= true;
      nameLang = 'الفرنسية';
    }
    update();
  }
}