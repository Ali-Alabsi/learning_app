
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_app/core/shared/color.dart';

import '../../../core/shared/theming/text_style.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsetsDirectional.only(
          bottom: 10,
          start: 25,
          end: 25
        ),
        child: Container(
          // color: Colors.blue,
          child: Stack(
            alignment:Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 70
                ),
                child: Container(
                  padding: EdgeInsetsDirectional.only(top: 70),
                  decoration: BoxDecoration(
                    color: ProjectColors.whiteColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: ProjectColors.greyColor.withOpacity(0.5),
                        offset: Offset.zero,
                        blurRadius: 4,
                        spreadRadius: 4
                      )
                    ]
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text('محمد عامر القباطي ' , style: TextStyles.font18BlackBold,),
                      Text('mohammed@gmail.com' , style: TextStyles.font18GreyW400,),
                      ListItemAllInProfile(),
                    ],
                  ),
                ),
              ),
              Positioned(
                 top: 0,
                  child: ShowImageInProfile()),

            ],
          ),
        ),
      ),
    );
  }
}

class ListItemAllInProfile extends StatelessWidget {
  const ListItemAllInProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ItemListInProfile(name: 'تعديل الحساب', icon: Icons.account_circle_outlined,),
            ItemListInProfile(name: 'الاشعارات', icon: Icons.notifications_outlined,),
            ItemListInProfile(name: 'اللغة', icon: Icons.language, nameLang: 'العربية'),
            ItemListInProfile(name: 'الوضع المظلم', icon: Icons.visibility_outlined,),
            ItemListInProfile(name: 'مركز المساعدة', icon: Icons.help_outline,),
            ItemListInProfile(name: 'تواصل معنا', icon: Icons.email_outlined,),
            ItemListInProfile(name: 'تسجيل الخروج', icon: Icons.power_settings_new,),
          ],
        ),
      ),
    );
  }
}

class ItemListInProfile extends StatelessWidget {
  final String name;
  final String? nameLang;
  final IconData icon;
  const ItemListInProfile({
    super.key, required this.name, required this.icon, this.nameLang,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon,size: 25,),
              SizedBox(width:10,),
              Text('$name' , style: TextStyles.font14BlackBold,),
            ],
          ),
          Row(
            children: [
             nameLang!=null ?  Text('$nameLang' , style: TextStyles.font16mainColorBold,) :SizedBox(),
              SizedBox(width: 8,),
              Icon(Icons.arrow_back_ios_new_sharp),
            ],
          )
        ],
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
              child: Icon(Icons.account_circle ,size: 140, color: ProjectColors.mainColor,),
            ),
            radius: 73,
            backgroundColor: ProjectColors.mainColor
            ,
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: InkWell(
              onTap: (){
                ImagePicker().pickImage(source: ImageSource.camera).then((value) {
                  print('Upload Image Is Success');
                }
                );
              },
              child: Container(
                padding: EdgeInsetsDirectional.all(4),
                child: Icon(Icons.image_outlined , color: ProjectColors.mainColor,),
                decoration: BoxDecoration(
                  color: ProjectColors.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: ProjectColors.mainColor,
                    width: 3
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
