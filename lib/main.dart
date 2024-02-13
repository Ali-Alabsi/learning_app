import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'contraller/profile_controller.dart';
import 'core/shared/color.dart';
import 'view/screen/Login.dart';
import 'view/screen/Signup.dart';
import 'view/screen/layout_home/layout_home.dart';
import 'view/screen/profile/edit_profile.dart';
import 'view/screen/profile/lang.dart';
import 'view/screen/review.dart';

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
        // home: (),
        initialRoute: '/Login',
        getPages: [
          GetPage(name: '/LayoutHome', page: () => LayoutHome()),
          GetPage(name: '/Login', page: () => Login()),
          GetPage(name: '/Signup', page: () => Signup()),
          GetPage(name: '/Lang', page: () => Lang()),
          GetPage(name: '/EditProfile', page: () => EditProfile()),
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
