import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailsCoursesController extends GetxController{
  int numberPage = 0;

  changePage(int i){
    numberPage = i;
    update();
  }
  CollectionReference dataCourses  = FirebaseFirestore.instance.collection('courses');
  CollectionReference dataCategories = FirebaseFirestore.instance.collection('categories');
   List listCourses = [];
   List listCategoriesCourses = [];
  addDataToListCourses() async {
    QuerySnapshot dataCoursesT = await  FirebaseFirestore.instance.collection("courses").where('active',isEqualTo: true).get();
      listCourses.addAll(dataCoursesT.docs);
     print('Data Courses ${listCourses[0]['name']}' );
  }
  addDataToListCategoriesCourses() async {
    QuerySnapshot dataCategoriesCoursesT = await  FirebaseFirestore.instance.collection("categories").get();
      listCategoriesCourses.addAll(dataCategoriesCoursesT.docs);
     print('Data Categories Courses ${listCategoriesCourses[0]['name']}' );
  }
  CollectionReference dataReviews  = FirebaseFirestore.instance.collection('review');
  @override
  void onInit() {
    // TODO: implement onInit
    addDataToListCourses();
    addDataToListCategoriesCourses();
    super.onInit();
  }
}