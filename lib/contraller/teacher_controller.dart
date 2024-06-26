import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class TeacherController extends GetxController{
  CollectionReference dataTeachers  = FirebaseFirestore.instance.collection('teachers');
  CollectionReference dataTeacherReview  = FirebaseFirestore.instance.collection('teacher_review');
  CollectionReference dataCourses = FirebaseFirestore.instance.collection('courses');
  CollectionReference dataCoursesStudent = FirebaseFirestore.instance.collection('student_courses');
  int i =0 ;
  changeScreen(index) {
    i =index;
    update();
  }
  // viewDataTeachers() async{
  //   DocumentSnapshot get = await  FirebaseFirestore.instance.collection("users").doc('${FirebaseAuth.instance.currentUser!.uid}').get();
  //   print(get.data());
  //   dataTeachers = get.data() as Map<String, dynamic>;
  //   print(userData['name']);
  //   // data = await  FirebaseFirestore.instance.collection("users").doc('2KKEQmSh3hY9tvbv7WXWttIa1C92').get();
  //   // userData.addAll(get.data);
  //   // print(userData);
  // }
}