import 'package:get/get.dart';

class HelpScreenController extends GetxController{
  bool isScreenCallMe = true;
  changeToScreenCallMe (){
    isScreenCallMe = true;
    print('a');
    update();
  }
  changeToScreenReview(){
    isScreenCallMe = false;
    update();
  }
}