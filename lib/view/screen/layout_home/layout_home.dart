import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learning_app/contraller/loyout_controller.dart';

import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../widget/courses_widget.dart';
import '../../widget/layout_widget.dart';
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
        appBar: AppBarLayout(context),
        body: GetBuilder<LayoutController>(
          builder: (controller){
            return controller.Screen[controller.currentIndex];
          },
        ),
        bottomNavigationBar: bottomNavigationBarCode(obGet: obGet)
    );
  }
}
