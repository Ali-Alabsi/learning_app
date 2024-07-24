import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../contraller/chat_controller.dart';
import '../../../core/shared/color.dart';
import '../../../core/shared/controller.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../../core/widget/app_text_form_filed.dart';
import '../../../core/widget/view_data_for_firebase_with_loading.dart';
import '../../widget/chat_widgets.dart';

class ChatScreen extends StatelessWidget {
  final idReceived;
  final  index;
  final String name;

  const ChatScreen(
      {super.key,  this.index, this.idReceived, required this.name});

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
            // myDateOfMessage(
            //   date: 'اليوم',
            // ),
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
                                  return myChatMessage2(
                                      message:snapshot.data!.docs[index]['text'],
                                      txtStyle: TextStyles.font14WhiteW500,
                                      date: snapshot.data!.docs[index]['date']
                                  );

                                } else if (snapshot.data!.docs[index]
                                ['res_id'] ==
                                    idReceived &&
                                    snapshot.data!.docs[index]['send_id'] ==
                                        FirebaseAuth
                                            .instance.currentUser!.uid) {
                                  return myChatMessage2(
                                      message:snapshot.data!.docs[index]['text'],
                                      txtStyle: TextStyles.font14mainColorBold,
                                      date: snapshot.data!.docs[index]['date']
                                  );
                                  //   CardMessageForSender(
                                  //   urlImageReceiver: '',
                                  //   index: index,
                                  //   snapshot: snapshot,
                                  // );
                                } else {
                                  return SizedBox();
                                }
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 15,
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

// class CardMessageForSender extends StatelessWidget {
//   const CardMessageForSender({
//     super.key,
//     required this.urlImageReceiver,
//     required this.index,
//     required this.snapshot,
//   });
//
//   final String urlImageReceiver;
//   final int index;
//   final snapshot;
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.ltr,
//       child: Container(
//         width: 50,
//         padding: EdgeInsetsDirectional.all(4),
//         margin: EdgeInsetsDirectional.only(
//           top: 10,
//           bottom: 10,
//           start: 20,
//           end: 120,
//         ),
//         decoration: BoxDecoration(
//           color: ProjectColors.mainColor.withOpacity(.8),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: ListTile(
//           contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//           dense: true,
//           title: Text(
//             snapshot.data!.docs[index]['text'],
//             style: TextStyles.font14WhiteW500,
//           ),
//           // Date Of Today
//           subtitle: Text(
//             (snapshot.data!.docs[index]['date']),
//             style: TextStyles.font14GreyW300,
//           ),
//           leading: CircleAvatar(
//             backgroundImage: NetworkImage(urlImageReceiver),
//             radius: 20,
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyChatMessage extends StatelessWidget {
  final String message;
  final txtStyle;

  const MyChatMessage({Key? key, required this.message, required this.txtStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: txtStyle == TextStyles.font14WhiteW500
          ? EdgeInsetsDirectional.only(
        end: 100,
        bottom: 10,
      )
          : EdgeInsetsDirectional.only(
        start: 100,
        bottom: 10,
      ),
      padding: EdgeInsetsDirectional.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        borderRadius: txtStyle == TextStyles.font14WhiteW500
            ? BorderRadiusDirectional.only(
          topEnd: Radius.circular(10),
          bottomEnd: Radius.circular(10),
          bottomStart: Radius.circular(10),
        )
            : BorderRadiusDirectional.only(
          topStart: Radius.circular(10),
          bottomEnd: Radius.circular(10),
          bottomStart: Radius.circular(10),
        ),
        gradient: LinearGradient(
          colors: txtStyle == TextStyles.font14WhiteW500
              ? [
            ProjectColors.mainColor,
            ProjectColors.mainColor.withOpacity(0.8),
          ]
              : [
            ProjectColors.greyColors200,
            ProjectColors.greyColors200,
          ],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              message,
              style: txtStyle,
              textAlign: TextAlign.start,
            ),
          ),
          Text(
            "20",
            style: txtStyle == TextStyles.font14WhiteW500
                ? TextStyles.font11WhiteW300
                : TextStyles.font11GreyW300,
          ),
        ],
      ),
    );
  }
}

myChatMessage2({
  required message,
  // required textAlign,
  required txtStyle,
  required  date,
})   {
  return Container(
    margin: txtStyle == TextStyles.font14WhiteW500
        ? EdgeInsetsDirectional.only(
      end: 100,
      bottom: 10,
    )
        : EdgeInsetsDirectional.only(
      start: 100,
      bottom: 10,
    ),
    padding: EdgeInsetsDirectional.symmetric(
      vertical: 10,
      horizontal: 15,
    ),
    alignment: AlignmentDirectional.centerStart,
    decoration: BoxDecoration(
      borderRadius: txtStyle == TextStyles.font14WhiteW500
          ? BorderRadiusDirectional.only(
        topEnd: Radius.circular(10),
        bottomEnd: Radius.circular(10),
        bottomStart: Radius.circular(10),
      )
          : BorderRadiusDirectional.only(
        topStart: Radius.circular(10),
        bottomEnd: Radius.circular(10),
        bottomStart: Radius.circular(10),
      ),
      gradient: LinearGradient(
        colors: txtStyle == TextStyles.font14WhiteW500
            ? [
          ProjectColors.mainColor,
          ProjectColors.mainColor.withOpacity(0.8),
        ]
            : [
          ProjectColors.greyColors200,
          ProjectColors.greyColors200,
        ],
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomEnd,
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            message,
            style: txtStyle,
            textAlign: TextAlign.start,
          ),
        ),
        Text(
          date==null ? '00': DateFormat('HH:mm:ss').format(date.toDate()),
          style: txtStyle == TextStyles.font14WhiteW500
              ? TextStyles.font11WhiteW300
              : TextStyles.font11GreyW300,
        ),
      ],
    ),
  );
}
