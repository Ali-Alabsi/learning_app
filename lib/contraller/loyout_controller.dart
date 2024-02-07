
import 'package:get/get.dart';

import '../view/screen/chat/chat_inbox.dart';
import '../view/screen/courses/courses.dart';
import '../view/screen/home/home.dart';
import '../view/screen/project/project.dart';

class LayoutController extends GetxController{
  int currentIndex = 0;
  List Screen =[
    Home(),
    Courses(),
    ChatInboxScreen( ),
    Project(),
    Home(),
  ];

  List<String> nameScreen=[
    "ألرئسية",
    "الكورسات",
    "الدردشات",
    "المشاريع",
    "البروفايل"
  ];
  changeCurrentIndex(int i){
    currentIndex = i;
    update();
  }
}