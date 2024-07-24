import 'package:flutter/material.dart';
import 'package:learning_app/core/dependency_injection/dependency_injection.dart';
import 'package:learning_app/core/widget/no_data.dart';
import 'package:learning_app/core/widget/shimmer_widget.dart';
import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';


class ListItemReviewInCoursess extends StatelessWidget {
  final String courseId;
  const ListItemReviewInCoursess({
    super.key, required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DependencyInjection.obGetCourses.dataReviews.where('course_id' , isEqualTo: courseId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              if(snapshot.data!.docs.length ==0){
                return NoDataWidget(title: 'لا توجد تعليقات خاصة بهذا الكورس',);
              }else{
              return ListView.separated(
                  itemBuilder: (context , index)=>ItemReviewInViewDetailsCourses(snapshot: snapshot, index: index,),
                  separatorBuilder:(context , index)=> SizedBox(height: 10,), itemCount: snapshot.data!.docs.length);}
            } else {
              return Center(child: CircularProgressIndicator());
            }
          } else {
            return ListView.separated(
                itemBuilder: (context , index){
                  return ShimmerWidget(widget: Card(
                    child: Container(
                      height: 150,
                      width: double.infinity,
                    ),
                  ));
                }, separatorBuilder: (context , index){
                  return SizedBox(height: 15,);
            }, itemCount: 10);
          }
        }
    );
  }
}

class ItemReviewInViewDetailsCourses extends StatelessWidget {
  final snapshot;
  final int index;
  const ItemReviewInViewDetailsCourses({
    super.key,required this.snapshot, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 10 ,vertical: 10),
      margin: EdgeInsetsDirectional.only(top: 10),
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
              child: Image.asset(
                'assets/images/AppFood.jpg',
                fit: BoxFit.cover,
              )),
          SizedBox(width: 15,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      snapshot.data!.docs[index].data()['student_name'],
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
                          Text( snapshot.data!.docs[index].data()['evaluation'] ,style: TextStyles.font14BlackBold,),
                        ],
                      ),
                    )
                  ],
                ),
                Text(
                    snapshot.data!.docs[index].data()['details'],
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
                    Text( snapshot.data!.docs[index].data()['date'],)
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