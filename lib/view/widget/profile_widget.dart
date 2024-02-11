
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/shared/color.dart';
import '../../core/shared/theming/text_style.dart';

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
