import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learning_app/contraller/chat_controller.dart';

import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../../core/widget/image_cache_error.dart';
import '../../../core/widget/view_data_for_firebase_with_loading.dart';
import '../../widget/chat_widgets.dart';
import '../course_description/s.dart';
import 'chat.dart';
import 'chat_test.dart';

class ChatInboxScreen extends StatelessWidget {
  ChatInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ProjectColors.mainColor,
        child: Icon(
          Icons.chat_outlined,
          color: ProjectColors.whiteColor,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('محادثات مع الطلاب' ,style: TextStyles.font16mainColorBold,),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: GetBuilder<ChatController>(
                init: ChatController(),
                builder: (controller) {
                  return ViewDataForFireBaseWithLoading(
                    future: controller.dataUser.get(),
                    widgetView: (snapshot) {
                      return ListView.separated(
                          itemBuilder: (context , index){
                            return ItemCardChatInbox(snapshot: snapshot, index: index);
                          }, separatorBuilder: (context , index){
                            return SizedBox(height: 15,);
                      }, itemCount: snapshot.data.docs.length)
                      ;
                    },
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('محادثات مع المعلمين' ,style: TextStyles.font16mainColorBold,),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: GetBuilder<ChatController>(
                init: ChatController(),
                builder: (controller) {
                  return ViewDataForFireBaseWithLoading(
                    future: controller.dataTeacher.get(),
                    widgetView: (snapshot) {
                      return ListView.separated(
                          itemBuilder: (context , index){
                            return ItemCardChatInbox(snapshot: snapshot, index: index, isTeacher: true,);
                          }, separatorBuilder: (context , index){
                        return SizedBox(height: 15,);
                      }, itemCount: snapshot.data.docs.length)
                      ;
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class ItemCardChatInbox extends StatelessWidget {
  final snapshot;
  final int index;
  final bool isTeacher ;
  const ItemCardChatInbox(
      {Key? key, required this.snapshot, required this.index,  this.isTeacher =false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: (){
          Get.to(ChatScreen(
            index: index,
            idReceived: snapshot.data.docs[index].id,
            name: isTeacher ?  snapshot.data.docs[index]['name']:snapshot.data.docs[index]['username'],
          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: ProjectColors.mainColor,
                  child: Container(
                    width: 45,
                    height: 45,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.5),
                    ),
                    child: ImageNetworkCache(
                      url: snapshot.data.docs[index]['image'],
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isTeacher ?  snapshot.data.docs[index]['name']:snapshot.data.docs[index]['username'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font14BlackBold,
                    ),
                    Text(
                      snapshot.data.docs[index]['email'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font14GreyW300,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 23,
                  height: 23,
                  alignment: AlignmentDirectional.center,
                  padding: EdgeInsetsDirectional.all(2),
                  decoration: BoxDecoration(
                    color: ProjectColors.mainColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "",
                    textAlign: TextAlign.center,
                    style: TextStyles.font11WhiteW300,
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
