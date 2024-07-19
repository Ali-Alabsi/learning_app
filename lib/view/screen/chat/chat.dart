import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/contraller/chat_controller.dart';
import 'package:learning_app/core/shared/controller.dart';
import 'package:learning_app/core/widget/app_text_form_filed.dart';
import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../../core/widget/view_data_for_firebase_with_loading.dart';
import '../../widget/chat_widgets.dart';

class ChatScreen extends StatelessWidget {
  final idReceived;
  final int index;
  final String name;

  const ChatScreen({super.key, required this.index, this.idReceived, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(name, style: TextStyles.font18mainColorBold),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Column(
          children: [
            myDateOfMessage(
              date: 'اليوم',
            ),
            Expanded(
              child: GetBuilder<ChatController>(
                  init: ChatController(),
                  builder: (controller) {
                    return StreamBuilder(
                      stream: controller.dataChat,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasData) {
                          return ListView.separated(
                              itemBuilder: (context, index) {

                                if (snapshot.data!.docs[index]['send_id'] ==
                                        idReceived &&
                                    snapshot.data!.docs[index]['res_id'] ==
                                        FirebaseAuth
                                            .instance.currentUser!.uid) {
                                  // return Center(child: Text(snapshot.data!.docs[index]['text'],));
                                  return CardMessageForReceiver(
                                    urlImageSender: '',
                                    index: index,
                                    snapshot: snapshot,
                                  );
                                } else if (snapshot.data!.docs[index]
                                            ['res_id'] ==
                                        idReceived &&
                                    snapshot.data!.docs[index]['send_id'] ==
                                        FirebaseAuth
                                            .instance.currentUser!.uid) {
                                  return CardMessageForSender(
                                    urlImageReceiver: '',
                                    index: index,
                                    snapshot: snapshot,
                                  );
                                } else {
                                  return SizedBox();
                                }
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 15,
                                );
                                myChatMessage(
                                  message: 'ddd',
                                  txtStyle: TextStyles.font14BlackW500,
                                );
                              },
                              itemCount: snapshot.data.docs.length);
                        } else {
                          return Text('Not Data');
                        }
                      },
                    );
                  }),
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
                        child: AppTextFormFiled(
                      hintText: 'اكتب رسالتك هنا',
                      noSpaceTextInputFormatter: false,
                      controller: MyController.sendMessage,
                    )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GetBuilder<ChatController>(builder: (controller) {
                    return Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ProjectColors.mainColor,
                      ),
                      child: myIconButton(
                        onPressed: () {
                          controller.sendMessage(
                            idReceived,
                            MyController.sendMessage.text,
                          );
                          MyController.sendMessage.clear();
                        },
                        icon: Icon(
                          Icons.send,
                          color: ProjectColors.whiteColor,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardMessageForReceiver extends StatelessWidget {
  const CardMessageForReceiver({
    super.key,
    required this.urlImageSender,
    required this.index,
    this.snapshot,
  });

  final String urlImageSender;
  final int index;
  final snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      padding: EdgeInsetsDirectional.all(4),
      margin: EdgeInsetsDirectional.only(
        top: 10,
        bottom: 10,
        start: 20,
        end: 120,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        dense: true,
        title: Text(snapshot.data!.docs[index]['text']),
        // Date Of Today
        subtitle: Text(
          (snapshot.data!.docs[index]['date']),
        ),

        leading: CircleAvatar(
          backgroundImage: NetworkImage(urlImageSender),
          radius: 20,
        ),
      ),
    );
  }
}

class CardMessageForSender extends StatelessWidget {
  const CardMessageForSender({
    super.key,
    required this.urlImageReceiver,
    required this.index,
    required this.snapshot,
  });

  final String urlImageReceiver;
  final int index;
  final snapshot;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: 50,
        padding: EdgeInsetsDirectional.all(4),
        margin: EdgeInsetsDirectional.only(
          top: 10,
          bottom: 10,
          start: 20,
          end: 120,
        ),
        decoration: BoxDecoration(
          color: ProjectColors.mainColor.withOpacity(.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          dense: true,
          title: Text(
            snapshot.data!.docs[index]['text'],
            style: TextStyles.font14WhiteW500,
          ),
          // Date Of Today
          subtitle: Text(
            (snapshot.data!.docs[index]['date']),
            style: TextStyles.font14GreyW300,
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(urlImageReceiver),
            radius: 20,
          ),
        ),
      ),
    );
  }
}
