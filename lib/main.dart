import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:learning_app/view/screen/courses/courses.dart';
import 'package:learning_app/view/screen/home/home.dart';
import 'package:learning_app/view/screen/pdf/pdf_view.dart';
import 'package:learning_app/view/screen/project/project_details_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'contraller/middleware/auth_middleware.dart';
import 'contraller/profile_controller.dart';
import 'core/shared/color.dart';
import 'core/teast/test_shimmer.dart';
import 'core/teast/video_player.dart';
import 'core/widget/shimmer_widget.dart';
import 'firebase_options.dart';
import 'view/screen/Welcome.dart';
import 'view/screen/Welcome1.dart';
import 'view/screen/auth/Login.dart';
import 'view/screen/courses/courses_category.dart';
import 'view/screen/notification_test.dart';
import 'view/screen/profile/Privacy_Policy.dart';
import 'view/screen/auth/Signup.dart';
import 'view/screen/profile/notification.dart';
import 'view/screen/course_description/about_in_details_courses.dart';
import 'view/screen/course_description/course_description_Screen.dart';
import 'view/screen/course_description/lessons_in_details_courses.dart';
import 'view/screen/helper_screen/layout_help_screen.dart';
import 'view/screen/layout_home/layout_home.dart';
import 'view/screen/profile/edit_profile.dart';
import 'view/screen/profile/lang.dart';
import 'view/screen/search/main_search.dart';
import 'view/screen/search_corsess_and_teacher/search_corsess.dart';
import 'view/screen/search_corsess_and_teacher/search_teacher.dart';
import 'view/screen/search_drop/search_drop.dart';
import 'view/screen/teacher/teacher.dart';
import 'view/screen/video_player/video_player.dart';
import 'view/screen/teacher/view_details_in_teacher.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blueAccent,
    ),
  );
  runApp( MyApp());
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
        initialRoute:'/Login',
        // home: MainSearch(),
        // initialRoute: '/Privacy_policy',
        getPages: [
          GetPage(name: '/LayoutHome', page: () => LayoutHome()),
          // GetPage(name: '/Courses', page: () => Courses()),
          GetPage(name: '/Welcome', page: () => Welcome()),
          GetPage(name: '/Login', page: () => Login()  , middlewares: [AuthMiddleware()] ),
          GetPage(name: '/Signup', page: () => Signup()),
          GetPage(name: '/Notifications', page: () => Notifications()),
          GetPage(name: '/Lang', page: () => Lang()),
          GetPage(name: '/Teacher', page: () => Teacher()),
          GetPage(name: '/EditProfile', page: () => EditProfile()),
          GetPage(name: '/PrivacyPolicy', page: () => PrivacyPolicy()),
          GetPage(name: '/LayoutHelpScreen', page: () => LayoutHelpScreen()),
          // GetPage(name: '/ViewCoursesInTeacher', page: () => ViewCoursesInTeacher()),
          // GetPage(name: '/CourseDescriptionScreen', page: () => CourseDescriptionScreen()),
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
