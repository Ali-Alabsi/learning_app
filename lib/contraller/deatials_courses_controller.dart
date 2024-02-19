import 'package:get/get.dart';

class DetailsCoursesController extends GetxController{
  int numberPage = 0;
  changePage(int i){
    numberPage = i;
    update();
  }
}