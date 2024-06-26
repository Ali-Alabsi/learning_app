import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learning_app/core/firebase_concepts/end_points.dart';
import 'package:learning_app/core/shared/controller.dart';
// Future SingUpModel (username , password , email ,  phone) async {
//   final _auth = FirebaseAuth.instance;
//           try {
//             UserCredential userCredential = await FirebaseAuth.instance
//                 .createUserWithEmailAndPassword(
//                 email: email, password: password);
//             // If successful, get the user object
//             User? user = userCredential.user;
//             // Update the user display name with the username
//             await user?.updateDisplayName(username);
//             await user?..updatePhoneNumber(phoneCredential);
//             // Save the user additional data in Firestore
//             await FirebaseFirestore.instance
//                 .collection('users')
//                 .doc(user.uid)
//                 .set({
//               'username': _username,
//               'email': _email,
//               'address': _address,
//               'phone': _phone
//             });
//             // Show a success message
//             ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Account created for $_username!')));
//             // Navigate to the home page
//             Navigator.pushNamed(context, '/home');
//           } on FirebaseAuthException catch (e) {
//             // If creating a new account fails, show an error message
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(SnackBar(content: Text(e.message)));
//           }
//         } else {
//           // If sign in fails for any other reason, show an error message
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text(e.message)));
//         }
//       }
// }




class SingUpModel {
   final  String message ;
  SingUpModel({required this.message});
   String getMessage(){
    return message;
}
   factory SingUpModel.formJson(String jsonData){
     return SingUpModel(message: jsonData);
   }
}