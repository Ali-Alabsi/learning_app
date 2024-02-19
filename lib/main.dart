import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:learning_app/view/screen/teasher/teasher.dart';
import 'contraller/profile_controller.dart';
import 'core/shared/color.dart';
import 'view/screen/Login.dart';
import 'view/screen/Privacy_Policy.dart';
import 'view/screen/Signup.dart';
import 'view/screen/notification.dart';
import 'view/screen/course_description/abote.dart';
import 'view/screen/course_description/course_description_Screen.dart';
import 'view/screen/course_description/tutorials.dart';
import 'view/screen/helper_screen/layout_help_screen.dart';
import 'view/screen/layout_home/layout_home.dart';
import 'view/screen/profile/edit_profile.dart';
import 'view/screen/profile/lang.dart';
import 'view/screen/view_corses_in_teacher/view_corses_in_teacher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) => GetMaterialApp(
        defaultTransition: Transition.rightToLeft,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(scrolledUnderElevation: 0),
          primarySwatch: createMaterialColor(ProjectColors.mainColor),
          fontFamily: 'Tajawal',
          colorScheme: ColorScheme.fromSeed(seedColor: ProjectColors.mainColor),
          useMaterial3: true,
        ),
        // home: Privacy_policy(),
        // home: Notifications(),
        initialRoute: '/Login',
        // home: CourseDescriptionScreen(),
        // home: LayoutHome(),
        // initialRoute: '/Login',
        // initialRoute: '/Privacy_policy',
        getPages: [
          GetPage(name: '/LayoutHome', page: () => LayoutHome()),
          GetPage(name: '/Login', page: () => Login()),
          GetPage(name: '/Signup', page: () => Signup()),
          GetPage(name: '/Notifications', page: () => Notifications()),
          GetPage(name: '/Lang', page: () => Lang()),
          GetPage(name: '/Teacher', page: () => Teacher()),
          GetPage(name: '/EditProfile', page: () => EditProfile()),
          GetPage(name: '/PrivacyPolicy', page: () => PrivacyPolicy()),
          GetPage(name: '/LayoutHelpScreen', page: () => LayoutHelpScreen()),
          GetPage(name: '/ViewCoursesInTeacher', page: () => ViewCoursesInTeacher()),
          GetPage(name: '/CourseDescriptionScreen', page: () => CourseDescriptionScreen()),
        ],
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [Locale("ar", "AE")],
        locale: Locale("ar", "AL"),
      ),
    );
  }




}
