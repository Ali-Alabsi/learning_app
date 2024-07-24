import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/shared/controller.dart';
import 'package:learning_app/core/widget/awesome_dialog.dart';
import 'package:learning_app/view/screen/home/home.dart';

class LoginController extends GetxController{
  final GlobalKey<FormState> loginForm = GlobalKey();
  CollectionReference dataLoginUsers = FirebaseFirestore.instance.collection('users');
  bool isLoadingLogin = false;
  Future login(BuildContext context , snapshot) async{
    isLoadingLogin = true;
    update();
    if( snapshot.data!.docs.length > 0){
      for (int i = 0; i < snapshot.data!.docs.length; i++) {
        if (snapshot.data!.docs[i]['active'] ==true) {

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
        }else{
          isLoadingLogin = false;
          AwesomeDialogFunction.awesomeDialogError(context, 'Error', 'هذا الحساب مقيد ولم يتم الموافقة علية');

        }
      }
    }
    else{
      isLoadingLogin = false;
      AwesomeDialogFunction.awesomeDialogError(context, 'Error', 'هذا الحساب ليس موجود');

    }
  }

  Future forgotPassword(context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      await  AwesomeDialogFunction.awesomeDialogSuccess(context, 'تم عملية تحديث كلمة المرور بنجاح', 'سوف يتم ارسال الى رسالة الى  البريد الالكتروني ويرجى اعادة كتابة كلمة المرور');

    } on FirebaseAuthException catch (err) {
      throw Exception(err.message.toString());
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
