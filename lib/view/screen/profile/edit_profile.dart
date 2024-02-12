
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_app/core/widget/app_text_form_filed.dart';

import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../../core/widget/button.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل الحساب' , style: TextStyles.font18BlackBold),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ShowImageInProfile(),
              SizedBox(
                height: 20,
              ),
              AppTextFormFiled(hintText: 'اسم المستخدم ',prefixIcon: Icon(Icons.account_circle),),
              SizedBox(
                height: 15,
              ),
              AppTextFormFiled(hintText: ' الايميل ',prefixIcon: Icon(Icons.email),),
              SizedBox(
                height: 15,
              ),
              AppTextFormFiled(hintText: ' كلمة المرور ',prefixIcon: Icon(Icons.lock),),
              SizedBox(
                height: 15,
              ),
              AppTextFormFiled(hintText: ' رقم الهاتف ',prefixIcon: Icon(Icons.phone),),
              SizedBox(
                height: 30,
              ),
              MainButton(name: 'تعديل الحساب', onPressed: (){}, margin: EdgeInsetsDirectional.symmetric(horizontal: 0),)
            ],
          ),
        ),
      ),
    );
  }
}

class ShowImageInProfile extends StatelessWidget {
  const ShowImageInProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            child: CircleAvatar(
              radius: 70,
              child: Icon(
                Icons.account_circle,
                size: 140,
                color: ProjectColors.mainColor,
              ),
            ),
            radius: 73,
            backgroundColor: ProjectColors.mainColor,
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: InkWell(
              onTap: () {
                ImagePicker()
                    .pickImage(source: ImageSource.camera)
                    .then((value) {
                  print('Upload Image Is Success');
                });
              },
              child: Container(
                padding: EdgeInsetsDirectional.all(4),
                child: Icon(
                  Icons.image_outlined,
                  color: ProjectColors.mainColor,
                ),
                decoration: BoxDecoration(
                    color: ProjectColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border:
                    Border.all(color: ProjectColors.mainColor, width: 3)),
              ),
            ),
          )
        ],
      ),
    );
  }
}