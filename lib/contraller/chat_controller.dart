import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatController extends GetxController{
  CollectionReference dataUser  = FirebaseFirestore.instance.collection('users');
  CollectionReference dataTeacher  = FirebaseFirestore.instance.collection('teachers');
  Stream dataChat  = FirebaseFirestore.instance.collection('chat').orderBy('date',  descending: false).snapshots();


  Future sendMessage(String user, String text) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    FirebaseFirestore.instance.collection('chat').add({
      'res_id': user,
      'send_id': '${FirebaseAuth.instance.currentUser!.uid}',
      'text': text,
      'date': formattedDate,
    });
  }
}