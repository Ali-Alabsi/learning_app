import 'package:get/get.dart';
class GetXCon extends GetxController{
  bool isPassword = false;
  changeIsPassword(){
    isPassword =! isPassword;
    update();
  }
}