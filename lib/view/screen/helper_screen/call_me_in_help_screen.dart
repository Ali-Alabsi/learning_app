

import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/shared/color.dart';
import '../../../core/shared/theming/text_style.dart';




class CallMeInHelpScreen extends StatelessWidget {
  const CallMeInHelpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       color: ProjectColors.moreGrayColor,
       child: Padding(
         padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 15),

           child: ListView(
             children: [
               Container(
                 padding: EdgeInsets.symmetric(horizontal: 15),
                 height: 60,
                 decoration: BoxDecoration(
                     color: ProjectColors.whiteColor,
                     borderRadius: BorderRadius.circular(20)
                 ),
                 child: InkWell(
                   onTap: (){
                     String? encodeQueryParameters(Map<String, String> params) {
                       return params.entries
                           .map((MapEntry<String, String> e) =>
                       '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                           .join('&');
                     }
// ···
                     final Uri emailLaunchUri = Uri(
                       scheme: 'mailto',
                       path: 'alabsiali247@gmail.com',
                       query: encodeQueryParameters(<String, String>{
                         'subject': 'There is a problem with the application',
                       }),
                     );

                     launchUrl(emailLaunchUri);
                   },
                   child: Row(
                     children: [
                       Icon(Icons.co_present_outlined,),
                       SizedBox(width: 20,),
                       Text("خدمه العملاء",style: TextStyles.font16BlackBold,),
                     ],
                   ),
                 ),
               ),
               SizedBox(
                 height: 25,),
               Container(
                 padding: EdgeInsets.symmetric(horizontal: 15),
                 height: 60,
                  decoration: BoxDecoration(
                      color: ProjectColors.whiteColor,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: InkWell(
                    onTap: () async{
                      openWhatsapp(text: '',context: context,number: '+967771750533');
                    },
                    child: Row(
                     children: [
                       Image.asset('assets/images/whatsapp.png',height: 25, width: 25,fit: BoxFit.fill,),
                       SizedBox(width: 20,),
                       Text("واتس اب",style: TextStyles.font16BlackBold,),
                     ],
                 ),
                  ),
               ),
               SizedBox(
                 height: 20,),
               Container(
                 padding: EdgeInsets.symmetric(horizontal: 15),
                 height: 60,
                 decoration: BoxDecoration(
                     color: ProjectColors.whiteColor,
                     borderRadius: BorderRadius.circular(20)
                 ),
                 child: Row(
                   children: [
                     Image.asset('assets/images/internet.png',height: 25, width: 25,fit: BoxFit.fill,),
                     SizedBox(width: 20,),
                     Text("موقع الكتروني",style: TextStyles.font16BlackBold,),
                   ],
                 ),
               ),
               SizedBox(
                 height: 20,),
               Container(
                 padding: EdgeInsets.symmetric(horizontal: 15),
                 height: 60,
                 decoration: BoxDecoration(
                     color: ProjectColors.whiteColor,
                     borderRadius: BorderRadius.circular(20)
                 ),
                 child: InkWell(
                   onTap: (){
                     _openFacebook();
                   },
                   child: Row(
                     children: [
                       Icon(Icons.facebook,color: Colors.blue,),
                       SizedBox(width: 20,),
                       Text("فيس بوك",style: TextStyles.font16BlackBold,),
                     ],
                   ),
                 ),
               ),
               SizedBox(
                 height: 20,),
               Container(
                 padding: EdgeInsets.symmetric(horizontal: 15),
                 height: 60,
                 decoration: BoxDecoration(
                     color: ProjectColors.whiteColor,
                     borderRadius: BorderRadius.circular(20)
                 ),
                 child: Row(
                   children: [
                     Icon(EvaIcons.twitter, color: Colors.blue,),
                     SizedBox(width: 20,),
                     Text("تويتر",style: TextStyles.font16BlackBold,),
                   ],
                 ),
               ),
               SizedBox(
                 height: 20,),
               Container(
                 padding: EdgeInsets.symmetric(horizontal: 15),
                 height: 60,
                 decoration: BoxDecoration(
                     color: ProjectColors.whiteColor,
                     borderRadius: BorderRadius.circular(20)
                 ),
                 child: InkWell(
                   onTap: (){
                     _launchInstagram();
                   },
                   child: Row(
                     children: [
                       Image.asset('assets/images/instagram.png',height: 25, width: 25,fit: BoxFit.fill,),
                       SizedBox(width: 20,),
                       Text("انستقرام",style: TextStyles.font16BlackBold,),
                     ],
                   ),
                 ),
               ),
             ],
           ),
         ),
     ),


    );
  }
}

void openWhatsapp(
    {required BuildContext context,
      required String text,
      required String number}) async {
  var whatsapp = number; //+92xx enter like this
  var whatsappURlAndroid =
      "whatsapp://send?phone="+whatsapp+"&text=$text";
  var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";
  if (Platform.isIOS) {
    // for iOS phone only
    if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
      await launchUrl(Uri.parse(
        whatsappURLIos,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Whatsapp not installed")));
    }
  } else {
    // android , web
    if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
      await launchUrl(Uri.parse(whatsappURlAndroid));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Whatsapp not installed")));
    }
  }
}

Future<void> _openFacebook() async {
  String fbProtocolUrl;
  if (Platform.isIOS) {
    fbProtocolUrl = 'fb://profile/{100040819552583}';
  } else {
    fbProtocolUrl = 'fb://page/{100040819552583}';
  }

  String fallbackUrl = 'https://www.facebook.com/profile.php?id=100040819552583';

  try {
    Uri fbBundleUri = Uri.parse(fbProtocolUrl);
    var canLaunchNatively = await canLaunchUrl(fbBundleUri);

    if (canLaunchNatively) {
      launchUrl(fbBundleUri);
    } else {
      await launchUrl(Uri.parse(fallbackUrl),
          mode: LaunchMode.externalApplication);
    }
  } catch (e, st) {
    // Handle this as you prefer
  }
}

_launchInstagram() async {
  const nativeUrl = "instagram://user?username=a_l_i247";
  const webUrl = "https://www.instagram.com/a_l_i247/";
  if (await canLaunch(nativeUrl)) {
    await launch(nativeUrl);
  } else if (await canLaunch(webUrl)) {
    await launch(webUrl);
  } else {
    print("can't open Instagram");
  }
}