import 'package:get/get.dart';
import 'package:learning_app/contraller/login_controller.dart';

import '../../contraller/app_controller.dart';
import '../../contraller/deatials_courses_controller.dart';
import '../../contraller/sign_up_controller.dart';
import '../../contraller/teacher_controller.dart';



class DependencyInjection{
  static LoginController obGetLogin= Get.put(LoginController() , permanent: true);
  static DetailsCoursesController obGetCourses= Get.put(DetailsCoursesController() , permanent: true);
  static TeacherController obGetTeacher= Get.put(TeacherController() , permanent: true);
  static AppController obGetApp= Get.put(AppController() , permanent: true);
}
// SingUpController obGetSingUp = Get.put(SingUpController() , permanent: true);
// LoginController obGetLogin= Get.put(LoginController() , permanent: true);

// Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

//snapshot.data!.docs[index].id