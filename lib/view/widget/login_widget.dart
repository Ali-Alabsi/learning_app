
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../contraller/getX.dart';

class ButtonCreateAccountInLoginScrren extends StatelessWidget {
  const ButtonCreateAccountInLoginScrren({
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
              Navigator.pushNamed(context, "/Signup");
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
    return Column(
      children: [
        SizedBox(
          height: 70,

        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(66),
          ),
          width: 320,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            onChanged: (String value) {
              print(value);
            },
            decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                hintText: "البريد الالكتروني",
                border: InputBorder.none),
          ),
        ),
        SizedBox(
          height: 23,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(66),
          ),
          width: 320,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: GetBuilder<GetXCon>(
            init: GetXCon(),
            builder: (obGet) => TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: obGet.isPassword,
              onFieldSubmitted: (String value) {
                print(value);
              },
              onChanged: (String value) {
                print(value);
              },
              decoration: InputDecoration(
                  suffix: InkWell(
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
                  icon: Icon(
                    Icons.lock,
                    color: Colors.black,
                    size: 19,
                  ),
                  hintText: "كلمة المرور",
                  // border: OutlineInputBorder(),
                  border: InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonInLoginScreen extends StatelessWidget {
  const ButtonInLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor:
        MaterialStateProperty.all(Colors.blue[700]),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 130, vertical: 10)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27))),
      ),
      child: Text(
        "login",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
