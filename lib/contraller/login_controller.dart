import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/shared/controller.dart';
import 'package:learning_app/core/widget/awesome_dialog.dart';
import 'package:learning_app/view/screen/home/home.dart';

class LoginController extends GetxController{
  final GlobalKey<FormState> loginForm = GlobalKey();
  bool isLoadingLogin = false;
  Future login(BuildContext context) async{
    isLoadingLogin = true;
    update();
    try{
      final credential= await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: MyController.emailLogin.text,
          password: MyController.passwordLogin.text,
      );
      if(credential.user!= null) {
      await  AwesomeDialogFunction.awesomeDialogSuccess(context, 'تم عملية تسجيل الدخول بنجاح', 'أسم المستخدم وكلمة المرور صحيح');
        Get.offAllNamed('/LayoutHome');

      }
      isLoadingLogin = false;
    }
    on FirebaseAuthException catch (e) {
      isLoadingLogin = false;
      AwesomeDialogFunction.awesomeDialogError(context, 'Error', 'أسم المستخدم او كلمة المرور خطاء ');
    }
    update();
  }

}