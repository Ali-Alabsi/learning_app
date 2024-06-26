import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AppController extends GetxController{
  List<int>? imageCount = List.generate(100000, (index) => 0);
  CollectionReference dataApp  = FirebaseFirestore.instance.collection('app');
  List listApp = [];
  addDataToListApp() async {
    QuerySnapshot data = await  FirebaseFirestore.instance.collection("app").get();
    listApp.addAll(data.docs);
    print(listApp.length);
    int i =0;
    for (var project in listApp) {
       imageCount![i] = project['image'].length.toInt();
       print('Loading......');
       // print(imageCount![i] );
       // print(i);
       // print(imageCount[i]);
      // print('Data App ${project['image'].length}');
      i++;
    }
  }
  @override
  void onInit()  {
    // TODO: implement onInit
    addDataToListApp();
    super.onInit();
  }
}