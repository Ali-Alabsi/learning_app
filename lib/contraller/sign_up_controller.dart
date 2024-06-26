import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_app/view/screen/home/home.dart';
import '../core/firebase_concepts/end_points.dart';
import '../core/shared/controller.dart';
import '../core/widget/awesome_dialog.dart';
import '../core/widget/snabar.dart';
import '../model/sign_up_model/sign_up_model.dart';

class SingUpController extends GetxController {
  bool isLoading = false;
  XFile? selectedImage;
  String? url;
  // GlobalKey<FormState> loginForm = GlobalKey();
  final GlobalKey<FormState> signUpForm = GlobalKey();
  bool isPassword = false;

  @override
  void onReady() {
    // TODO: implement onReady
    // signUpForm =GlobalKey();
    super.onReady();
  }
  changeIsPassword() {
    isPassword = !isPassword;
    update();
  }

  Future singUpController(context) async {
    isLoading = true;
    update();
    // Create Email And Password
    if(selectedImage!= null){
      try {
        final userEmailAndPassword =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: '${MyController.emailSignup.text}',
          password: '${MyController.passwordSignup.text}',
        );
        User? user = userEmailAndPassword.user;
        if(userEmailAndPassword.user?.uid != ''){
          final imageUpload = await FirebaseStorage.instance.ref().child('user/${userEmailAndPassword.user!.uid}.jpg');
          await imageUpload.putFile(File(selectedImage!.path));
          url = await imageUpload.getDownloadURL();
          print(imageUpload.fullPath);
        }
        // Create User With Name
        if (user != null) {
          FirebaseFirestore.instance
              .collection('${FireBaseKey.users}')
              .doc(user.uid)
              .set({
            '${FireBaseKey.userName}': '${MyController.nameSignup.text}',
            '${FireBaseKey.email}': '${MyController.emailSignup.text}',
            '${FireBaseKey.phone}': '${MyController.phoneSignup.text}',
            '${FireBaseKey.image}': url,
          });
        }
        final m = SingUpModel.formJson('تم أضافة المستخدم بنجاح');
        AwesomeDialogFunction.awesomeDialogSuccess(context, 'تم', "${m.message}");
        Get.off(Home());
        // snackBarWidget(context, '${m.message}');
        isLoading = false;
      } on FirebaseAuthException catch (e) {
        final m = SingUpModel.formJson('${e.code}');
        snackBarWidget(context, 'error ${m.message}');
        if (m.message == 'email-already-in-use') {
          AwesomeDialogFunction.awesomeDialogError(
              context, 'Error', 'هذا البريد الالكتروني تم انشاة سايقاً');
        } else {
          AwesomeDialogFunction.awesomeDialogError(
              context, 'Error', '${m.message}');
          // snackBarWidget(context, 'error $m');
        }
        isLoading = false;
      } catch (e) {
        final m = SingUpModel.formJson('${e}');
        isLoading = false;
      }
    }else{
      AwesomeDialogFunction.awesomeDialogError(
          context, 'Error', 'يرجى تحميل الصورة');
      isLoading = false;
    }

    update();
  }

  addImageToProfile( image)async{
    selectedImage = await image;
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    MyController.phoneSignup.text = '';
    MyController.emailSignup.text = '';
    MyController.nameSignup.text = '';
    MyController.passwordSignup.text = '';
  }
}
