import 'package:flutter/material.dart';
import 'package:learning_app/core/widget/app_text_form_filed.dart';

import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';

class SearchCourses extends StatelessWidget {
  const SearchCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 10),
            child: AppTextFormFiled(hintText: "تصميم 3D", suffixIcon: Icon(Icons.search)),
          ),
          Container(
            padding: EdgeInsets.symmetric( horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 55),
                        height: 40,

                        decoration: BoxDecoration(
                            color: ProjectColors.whiteColor,
                            borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: ProjectColors.mainColor)),
                        child: Center(
                          child: Text('الكورسات',
                            style: TextStyles.font18mainColorBold, maxLines: 1,),
                        )),
                  ),
                ),
                SizedBox(
                  width: 15,),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 55, ),
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ProjectColors.whiteColor,
                                width: 3
                            ),
                            color: ProjectColors.mainColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text('المرشدين', maxLines: 1,
                            style: TextStyles.font14WhiteW500,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,),
          Expanded(
            child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric( horizontal: 16,vertical: 16),
                    decoration: BoxDecoration(
                        color: ProjectColors.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow :[
                          BoxShadow(color: ProjectColors.blackColor,
                              offset: Offset(1,1), blurRadius: 3)]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(

                          children: [
                            CircleAvatar(
                              radius: 5,
                              child: Container(color: Colors.cyan,),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text('محمد عامر القباطي',style: TextStyles.font18mainColorBold,),
                                Text(' مصمم واجهات ويب',style: TextStyles.font14BlackW500,),
                              ],
                            )
                          ],
                        ),
                        Icon(Icons.mark_unread_chat_alt_outlined),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric( horizontal: 16,vertical: 16),
                    decoration: BoxDecoration(
                        color: ProjectColors.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow :[
                          BoxShadow(color: ProjectColors.blackColor,
                              offset: Offset(1,1), blurRadius: 3)]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(

                          children: [
                            CircleAvatar(
                              radius: 5,
                              child: Container(color: Colors.cyan,),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text('محمد عامر القباطي',style: TextStyles.font18mainColorBold,),
                                Text(' مصمم واجهات ويب',style: TextStyles.font14BlackW500,),
                              ],
                            )
                          ],
                        ),
                        Icon(Icons.mark_unread_chat_alt_outlined),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric( horizontal: 16,vertical: 16),
                    decoration: BoxDecoration(
                        color: ProjectColors.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow :[
                          BoxShadow(color: ProjectColors.blackColor,
                              offset: Offset(1,1), blurRadius: 3)]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(

                          children: [
                            CircleAvatar(
                              radius: 5,
                              child: Container(color: Colors.cyan,),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text('محمد عامر القباطي',style: TextStyles.font18mainColorBold,),
                                Text(' مصمم واجهات ويب',style: TextStyles.font14BlackW500,),
                              ],
                            )
                          ],
                        ),
                        Icon(Icons.mark_unread_chat_alt_outlined),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric( horizontal: 16,vertical: 16),
                    decoration: BoxDecoration(
                        color: ProjectColors.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow :[
                          BoxShadow(color: ProjectColors.blackColor,
                              offset: Offset(1,1), blurRadius: 3)]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(

                          children: [
                            CircleAvatar(
                              radius: 5,
                              child: Container(color: Colors.cyan,),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text('محمد عامر القباطي',style: TextStyles.font18mainColorBold,),
                                Text(' مصمم واجهات ويب',style: TextStyles.font14BlackW500,),
                              ],
                            )
                          ],
                        ),
                        Icon(Icons.mark_unread_chat_alt_outlined),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric( horizontal: 16,vertical: 16),
                    decoration: BoxDecoration(
                        color: ProjectColors.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow :[
                          BoxShadow(color: ProjectColors.blackColor,
                              offset: Offset(1,1), blurRadius: 3)]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(

                          children: [
                            CircleAvatar(
                              radius: 5,
                              child: Container(color: Colors.cyan,),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text('محمد عامر القباطي',style: TextStyles.font18mainColorBold,),
                                Text(' مصمم واجهات ويب',style: TextStyles.font14BlackW500,),
                              ],
                            )
                          ],
                        ),
                        Icon(Icons.mark_unread_chat_alt_outlined),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric( horizontal: 16,vertical: 16),
                    decoration: BoxDecoration(
                        color: ProjectColors.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow :[
                          BoxShadow(color: ProjectColors.blackColor,
                              offset: Offset(1,1), blurRadius: 3)]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(

                          children: [
                            CircleAvatar(
                              radius: 5,
                              child: Container(color: Colors.cyan,),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text('محمد عامر القباطي',style: TextStyles.font18mainColorBold,),
                                Text(' مصمم واجهات ويب',style: TextStyles.font14BlackW500,),
                              ],
                            )
                          ],
                        ),
                        Icon(Icons.mark_unread_chat_alt_outlined),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric( horizontal: 16,vertical: 16),
                    decoration: BoxDecoration(
                        color: ProjectColors.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow :[
                          BoxShadow(color: ProjectColors.blackColor,
                              offset: Offset(1,1), blurRadius: 3)]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(

                          children: [
                            CircleAvatar(
                              radius: 5,
                              child: Container(color: Colors.cyan,),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text('محمد عامر القباطي',style: TextStyles.font18mainColorBold,),
                                Text(' مصمم واجهات ويب',style: TextStyles.font14BlackW500,),
                              ],
                            )
                          ],
                        ),
                        Icon(Icons.mark_unread_chat_alt_outlined),
                      ],
                    ),
                  ),
                ]),
          ),
        ],
      ),

    );
  }
}
