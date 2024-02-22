import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../contraller/getX.dart';
import '../../core/widget/app_text_form_filed.dart';
import '../../core/widget/button.dart';
import '../../core/widget/valid.dart';

GetXCon obGet = Get.put(GetXCon());

class ButtonCreateAccountInLoginScreen extends StatelessWidget {
  const ButtonCreateAccountInLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لا امتلك حساب ',
          style: TextStyle(color: Colors.grey),
        ),
        TextButton(
            onPressed: () {
             Get.offNamed('/Signup');
            },
            child: Text('أنشاء حساب'))
      ],
    );
  }
}

class ListLoginInAntherAccount extends StatelessWidget {
  const ListLoginInAntherAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.facebook,
                size: 30,
              )),
          CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.email,
                size: 30,
              )),
          CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.apple,
                size: 30,
              ))
        ],
      ),
    );
  }
}

class NameOfAntherLogin extends StatelessWidget {
  const NameOfAntherLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: 94,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
            ),
          ),
        ),
        Text(
          'or continue with',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Arial Rounded MT Bold',
            fontWeight: FontWeight.w400,
            // height: 0,
            letterSpacing: 1.28,
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          width: 94,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: TextButton(
            onPressed: () {},
            child: Text(
              'نسيت كلمة المرور ؟',
              style: TextStyle(color: Colors.grey),
            )));
  }
}

class FormEmailAndPasswordInLoginScreen extends StatelessWidget {
  const FormEmailAndPasswordInLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        key: obGet.loginForm,
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            AppTextFormFiled(
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                if(isEmail(value!) ==false){
                  return 'هذا الايميل غير صحيح';
                }
              },
              hintText: 'البريد الالكتروني',
              prefixIcon: Icon(Icons.email),

            ),
            SizedBox(
              height: 30,
            ),
            GetBuilder<GetXCon>(
                init: GetXCon(),
                builder: (obGet) {
                  return AppTextFormFiled(
                    validator: (value){
                      if(isPassword(value!) ==false){
                        return 'كلمة المرور ضعية';
                      }
                    },
                    hintText: 'كلمة المرور',
                    prefixIcon: Icon(Icons.lock),
                    obscureText: obGet.isPassword,
                    suffixIcon: InkWell(
                        onTap: () {
                          obGet.changeIsPassword();
                        },
                        child: obGet.isPassword
                            ? Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.visibility,
                                color: Colors.black,
                              )),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class ButtonInLoginScreen extends StatelessWidget {
  const ButtonInLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return MainButton(name: 'LOGIN',onPressed: (){
      if(obGet.loginForm.currentState!.validate()){
        Get.offNamed('/LayoutHome');
      }

    },
      margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
    );
  }
}
