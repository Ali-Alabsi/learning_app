import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotifications {
  static String? nameToken ;
  static  getToken()async {
    final fcmToken =  await FirebaseMessaging.instance.getToken();
    nameToken = fcmToken;
    print(fcmToken);
    print('ddddddddddddddddddddddddd');
  }
}
