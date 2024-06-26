import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfilesController extends GetxController{
  CollectionReference dataUser  = FirebaseFirestore.instance.collection('users');

}