
import 'package:get/get.dart';

class ViewTeacherController extends GetxController{
  int i =0 ;
  changeScreen(index) {
    i =index;
    update();
  }
}