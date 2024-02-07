
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learning_app/contraller/loyout_controller.dart';

import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../widget/courses_widget.dart';
import '../../widget/project_widget.dart';
import '../chat/chat.dart';
import '../chat/chat_inbox.dart';
import '../courses/courses.dart';
import '../home/home.dart';
import '../project/project.dart';

class LayoutHome extends StatelessWidget {
  LayoutController obGet = Get.put(LayoutController());
   // LayoutHome({Key? key}) : super(key: key);

  LayoutHome({super.key});

// >>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarLayout(),
        body: GetBuilder<LayoutController>(
          builder: (controller){
            return controller.Screen[controller.currentIndex];
          },
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                  onTabChange: (i) {
                    obGet.changeCurrentIndex(i);
                    // setState(() {

                   // });
                  },
                  rippleColor: Colors.grey,
                  hoverColor: Colors.grey,
                  haptic: true,
                  tabBorderRadius: 15,
                  // tabActiveBorder: Border.all(color: Colors.black, width: 1),
                  // tabBorder: Border.all(color: Colors.grey, width: 1),
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 900),
                  gap: 8,
                  color: Colors.black87,
                  activeColor: ProjectColors.mainColor,
                  iconSize: 24,
                  tabBackgroundColor: ProjectColors.mainColor.withOpacity(0.1),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: 'ألرئيسية',
                    ),
                    GButton(
                      icon: Icons.menu_book_outlined,
                      text: 'الكورسات',
                    ),
                    GButton(
                      icon: Icons.chat,
                      text: 'الدردشات',
                    ),
                    GButton(
                      icon: Icons.apps,
                      text: 'المشاريع',
                    ),
                    GButton(
                      icon: Icons.account_circle,
                      text: 'البروفايل',
                    ),
                  ]),
            )))
    );
  }
}


AppBar AppBarLayout() {
  return AppBar(
    foregroundColor: ProjectColors.mainColor,
    elevation: 0,
    leading: Image.asset(
      'assets/images/app-icon.png',
      fit: BoxFit.cover,
    ),
    title: GetBuilder<LayoutController>(


      builder:(controller) => Text(
        '${controller.nameScreen[controller.currentIndex]}',
        style: TextStyles.font18BlackW500,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsetsDirectional.only(end: 15),
        child: Icon(Icons.exit_to_app_rounded),
      )
    ],
  );
}