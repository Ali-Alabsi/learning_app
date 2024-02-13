import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../contraller/help_screen_controller.dart';
import '../../../core/shared/theming/text_style.dart';
import 'call_me_in_help_screen.dart';
import 'review_in_help_screen.dart';

class LayoutHelpScreen extends StatelessWidget {
  LayoutHelpScreen({super.key});
  HelpScreenController obGet = Get.put(HelpScreenController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'مركز المساعده',
              style: TextStyles.font16BlackBold,
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "اتصل بنا",
                    style: TextStyles.font16BlackBold,
                  ),
                ),
                Tab(
                  child: Text(" التعليقات", style: TextStyles.font16BlackBold),
                ),
              ],
              onTap: (int i) {
                if (i == 0) {
                  obGet.changeToScreenCallMe();
                } else {
                  obGet.changeToScreenReview();
                }
              },
            ),
          ),
          body: GetBuilder<HelpScreenController>(
            init: HelpScreenController(),
            builder: (controller) {
              return controller.isScreenCallMe
                  ? CallMeInHelpScreen()
                  : ReviewInHelpScreen();
            },
          ),
        ));
  }
}
