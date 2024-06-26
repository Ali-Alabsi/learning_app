import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/contraller/login_controller.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../widget/login_widget.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  // onFieldSubmitted? value
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                    ),
                    Text(
                      "تسجيل الدخول",
                      style: TextStyles.font24BlackW600
                    ),
                  ],
                ),
                FormEmailAndPasswordInLoginScreen(),
                SizedBox(
                  height: 40,
                ),
                GetBuilder<LoginController>(
                  init: LoginController(),
                  builder: (controller) {
                    if(controller.isLoadingLogin==true){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }else{
                      return ButtonInLoginScreen( controller: controller, buildContext: context,);
                    }

                  }
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                      width: double.infinity,
                    ),
                    ForgetPassword(),
                    SizedBox(
                      height: 30,
                    ),
                    NameOfAntherLogin(),
                    SizedBox(
                      height: 20,
                    ),
                    ListLoginInAntherAccount(),
                    SizedBox(
                      height: 30,
                    ),
                    ButtonCreateAccountInLoginScreen()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
