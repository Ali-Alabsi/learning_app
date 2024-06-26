import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';
import '../../../core/widget/image_cache_error.dart';

class ItemReviewInReviewInTeacherDetails extends StatelessWidget {
  final  snapshot;
  final int index;
  const ItemReviewInReviewInTeacherDetails({
    super.key, required this.snapshot, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 10 ,vertical: 10),
      decoration: BoxDecoration(
          color: ProjectColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 60,
              width: 60,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30)),
              child: ImageNetworkCache(url: snapshot.data!.docs[index].data()!['student_image'],)
          ),
          SizedBox(width: 15,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      snapshot.data!.docs[index].data()!['student_name'],
                      style: TextStyles.font16mainColorBold,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 3),
                      height: 18,
                      width: 50,
                      decoration: BoxDecoration(
                          color: ProjectColors.mainColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: ProjectColors.mainColor
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.star ,size: 13 ,color: ProjectColors.amberColor,),
                          Text(  snapshot.data!.docs[index].data()!['elv'] ,style: TextStyles.font14BlackBold,),
                        ],
                      ),
                    )
                  ],
                ),
                Text(
                  snapshot.data!.docs[index].data()!['details'],
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite , color: ProjectColors.mainColor,),
                        Text('780' ,style: TextStyles.font14GreyW300,),
                      ],
                    ),
                    Text(  snapshot.data!.docs[index].data()!['date'])
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}