
import 'package:flutter/material.dart';
import 'package:learning_app/core/shared/function/firebase_notification.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:googleapis_auth/auth.dart';
// import 'package:googleapis/cloudmessaging/v1.dart';
class NotificationTest extends StatelessWidget {
  const NotificationTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Test'),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(onPressed: (){
              FirebaseNotifications.getToken();
            },child: Text('Notification Get'))
          ],
        ),
      ),
    );
  }
}

//
// Future<void> sendNotification(String to, String title, String body) async {
//   // قم بتبديل 'path/to/your_service_account.json' بمسار ملف JSON الخاص بك
//   var serviceAccount = ServiceAccount.fromJson(
//       jsonDecode(await File('path/to/your_service_account.json').readAsString()));
//
//   // قم بتحديد النطاقات المطلوبة
//   var scopes = [Cloudmessaging.cloudPlatformScope];
//
//   // قم بإنشاء عميل مصادقة
//   var client = await clientViaServiceAccount(serviceAccount, scopes);
//
//   // قم بإنشاء طلب الإشعار
//   var message = MessagingMessage(
//     notification: Notification(title: title, body: body),
//     to: to, // توكن الجهاز المستهدف
//   );
//
//   // قم بإرسال الطلب
//   try {
//     await cloudmessaging.v1.Messages.send(message).request(client);
//     print('Notification sent successfully');
//   } catch (e) {
//     print('Error sending notification: $e');
//   }
// }
