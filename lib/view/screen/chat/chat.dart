import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../widget/chat_widgets.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        // alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    myDateOfMessage(
                      date: 'اليوم',
                    ),
                    myChatMessage(
                      message: 'مرحبا بك، من فضلك أخبرنا كيف يمكننا مساعدتك.',
                      txtStyle: TextStyles.font14WhiteW500,
                    ),
                    myChatMessage(
                      message: 'كيف حالك؟ هل أنت بخير؟',
                      txtStyle: TextStyles.font14WhiteW500,
                    ),
                    myChatMessage(
                      message: 'ما هي الخدمات التي تقومون بتقديمها في شركتكم؟',
                      txtStyle: TextStyles.font14BlackW500,
                    ),
                    myChatMessage(
                      message: 'نعم، انا بخير',
                      txtStyle: TextStyles.font14BlackW500,
                    ),
                    myChatMessage(
                      message: 'شكرا لك ...',
                      txtStyle: TextStyles.font14WhiteW500,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Form(
                      child: myTextFormFieldInChat(
                        hintText: 'اكتب رسالتك هنا',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ProjectColors.mainColor,
                    ),
                    child: myIconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.send,
                        color: ProjectColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
