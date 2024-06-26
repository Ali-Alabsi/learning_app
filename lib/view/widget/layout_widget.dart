import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learning_app/view/screen/auth/Login.dart';

import '../../contraller/loyout_controller.dart';
import '../../core/shared/color.dart';
import '../../core/shared/theming/text_style.dart';
import '../../core/widget/awesome_dialog.dart';

class bottomNavigationBarCode extends StatelessWidget {
  const bottomNavigationBarCode({
    super.key,
    required this.obGet,
  });

  final LayoutController obGet;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GetBuilder<LayoutController>(
            builder: (controller) => GNav(
                onTabChange: (i) {
                  obGet.changeCurrentIndex(i);
                  // setState(() {

                  // });
                },
                selectedIndex: controller.currentIndex,
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
          ),
        )));
  }
}

AppBar AppBarLayout(context) {
  return AppBar(
    foregroundColor: ProjectColors.mainColor,
    elevation: 0,
    leading: Image.asset(
      'assets/images/app-icon.png',
      fit: BoxFit.cover,
    ),
    title: GetBuilder<LayoutController>(
      builder: (controller) => Text(
        '${controller.nameScreen[controller.currentIndex]}',
        style: TextStyles.font18BlackW500,
      ),
    ),
    actions: [
      InkWell(
        onTap: () {
          AwesomeDialogFunction.awesomeDialogQuestion(context, 'تنبية', 'هل تريد تسجيل الخروج ؟', () {
            Get.offAll(Login());
            FirebaseAuth.instance.signOut();
          }, () {});
        },
        child: Padding(
          padding: const EdgeInsetsDirectional.only(end: 15),
          child: Icon(Icons.exit_to_app_rounded),
        ),
      )
    ],
  );
}
