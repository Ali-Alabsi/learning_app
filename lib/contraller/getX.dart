import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class GetXCon extends GetxController{
  GlobalKey<FormState> loginForm  =GlobalKey();
  GlobalKey<FormState> signUpForm  =GlobalKey();
  bool isPassword = false;
  changeIsPassword(){
    isPassword =! isPassword;
    update();
  }
}