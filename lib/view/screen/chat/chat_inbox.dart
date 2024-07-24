import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../contraller/chat_controller.dart';
import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../../core/widget/image_cache_error.dart';
import '../../../core/widget/shimmer_widget.dart';
import '../../../core/widget/view_data_for_firebase_with_loading.dart';
import 'chat.dart';

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
      body: GetBuilder<ChatController>(
          init: ChatController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('محادثات مع ' ,style: TextStyles.font16mainColorBold,),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            controller.changeIndexCurrent(0);
                          },
                          child: Text(
                            'طالب',
                            style:  controller.indexCurrent ==0 ? TextStyles.font18WhiteW500 : TextStyles.font18mainColorBold,
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: controller.indexCurrent ==0 ? ProjectColors.mainColor : ProjectColors.whiteColor,
                              // i want radius 20 in ElevatedButton
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              minimumSize: Size(120, 55)),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            controller.changeIndexCurrent(1);
                          },
                          child: Text(
                            'معلم',
                            style:  controller.indexCurrent ==1 ? TextStyles.font18WhiteW500 : TextStyles.font18mainColorBold,
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: controller.indexCurrent ==1 ? ProjectColors.mainColor : ProjectColors.whiteColor,
                              // i want radius 20 in ElevatedButton
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              minimumSize: Size(120, 55)),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15,),
                  Container(
                    child: controller.indexCurrent ==0?  ListChatWithUserInChat()  : ListChatWithTeacherInChat(),
                  ),


                ],
              ),
            );
          }
      ),
    );
  }
}

class ListChatWithTeacherInChat extends StatelessWidget {
  const ListChatWithTeacherInChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<ChatController>(
          init: ChatController(),
          builder: (controller) {
            return ViewDataForFireBaseWithLoading(
              widgetLoading: ListView.separated(
                  itemBuilder: (context , index){
                    return  ShimmerWidget(
                      widget: Card(
                        elevation: 0,
                        child: Container(
                          height: 60,
                          width: double.infinity,

                        ),
                      ),
                    );
                  }, separatorBuilder: (context , index){
                return SizedBox(height: 15,);
              }, itemCount: 5),
              future: controller.dataTeacher.where('active',isEqualTo: true).get(),
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
    );
  }
}

class ListChatWithUserInChat extends StatelessWidget {
  const ListChatWithUserInChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<ChatController>(
          init: ChatController(),
          builder: (controller) {
            return ViewDataForFireBaseWithLoading(
              widgetLoading: ListView.separated(
                  itemBuilder: (context , index){
                    return  ShimmerWidget(
                      widget: Card(
                        elevation: 0,
                        child: Container(
                          height: 60,
                          width: double.infinity,

                        ),
                      ),
                    );
                  }, separatorBuilder: (context , index){
                return SizedBox(height: 15,);
              }, itemCount: 5),
              future: controller.dataUser.where('active',isEqualTo: true).get(),
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
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: InkWell(
        onTap: (){
          Get.to(
              ChatScreen(
            index: index,
            idReceived: snapshot.data.docs[index].id,
            name: isTeacher ?  snapshot.data.docs[index]['name']:snapshot.data.docs[index]['username'],
          )
          );
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
