import 'package:learning_app/view/screen/home/home.dart';
import 'package:flutter/material.dart';

import '../../core/dependency_injection/dependency_injection.dart';
import '../../core/widget/image_cache_error.dart';
import '../../view/widget/home_widget.dart';

// List listProject = [
//   {
//     "name": "مشروع توصيل طلبات مطعم",
//     "image": "assets/images/AppFood.jpg",
//     "image2": [
//       "assets/images/FigmaCourses.jpg",
//       "assets/images/AppFood.jpg",
//     ],
//     "details":
//         "تطبيق توصيل الطلبات الخاص بالمطعم حيث هذا التطبيق يمكن العميل من طلب الماكولات و توصيلها الى المنازل وايضاء يوفر هذا التطبيق مساحة تخزية عالية وايضاء يحتوي على نسخنين للعميل والمدير ولا ننسى ان هذا التطبيق يعمل الاندرويد الايفون",
//     "start": "4.6"
//   },
//   {
//     "name": "مشروع أدارة الملحظات",
//     "image": "assets/images/AppNote.jpg",
//     "details": "مشروع ملحظات",
//     "image2": [
//       "assets/images/FigmaCourses.jpg",
//       "assets/images/AppFood.jpg",
//     ],
//     "start": "4.1"
//   }
// ];



List<Widget> listProjectWidgetHome = [
  for (int i = 0; i < DependencyInjection.obGetApp.imageCount![0]; i++) ...[
    TopSclorProjectHome(listProject: DependencyInjection.obGetApp.listApp, i: i)
  ],
];

List<Widget> listProjectWidgetPageProject = [
  for (int i = 0; i < DependencyInjection.obGetApp.imageCount![0]; i++) ...[
    Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: ImageNetworkCache(url: DependencyInjection.obGetApp.listApp[0]['image'][0], fit: BoxFit.contain,)
    )
  ],
];

List<Widget>  imageAppInProject (int index){
  return
    [
      for (int i = 0; i < DependencyInjection.obGetApp.imageCount![index]; i++) ...[
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: ImageNetworkCache(url: DependencyInjection.obGetApp.listApp[index]['image'][i], fit: BoxFit.contain,)
            // child: Image.network(DependencyInjection.obGetApp.listApp[index]['image'][i] , fit: BoxFit.cover)
        )
      ],
    ];

}