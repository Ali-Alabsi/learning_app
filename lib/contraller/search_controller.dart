import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MySearchController extends GetxController{
  Stream dataCourses  = FirebaseFirestore.instance.collection('courses').snapshots();
}