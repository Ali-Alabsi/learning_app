
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'auth/Login.dart';
// import 'pages/Login.dart';
import 'package:get/get.dart';
class Welcome1 extends StatefulWidget {
  const Welcome1({super.key});

  @override
  State<Welcome1> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final controller =PageController();

  // get initialRoute =>  GetPage(name: '/Login', page: () => Login());
  @override
  // void initState() {
  //   super.initState();
  //   controller = AnimationController(vsync: this);
  // }
  //
  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) =>Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      // padding: EdgeInsetsDirectional.all(10),
      padding: const EdgeInsets.only(bottom: 80),
      child: PageView(
        controller: controller,
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
              ),
              Container(
                
                child: Column(

                  children: [

                    Container(
                      // alignment: Alignment.center,

                      child: SvgPicture.asset(
                        "assets/images/Webinar-bro.svg",
                        fit: BoxFit.fill,
                        height: 300,

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ), // -------------------------------------------------------

              Container(
                padding: EdgeInsetsDirectional.all(10),
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text(
                      'عبارة عن تطبيق تعليمي يقوم بتقديم الخدمات البرمجية والتعليميه في جميع لغات البرمجة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     SmoothPageIndicator(
                    //         controller:controller,
                    //         count:3,
                    //         effect: WormEffect(
                    //           spacing: 16,
                    //           dotColor: Colors.black26,
                    //           activeDotColor: Colors.teal.shade700,
                    //         ),
                    //         onDotClicked: (index)=>controller.animateToPage(
                    //           index,  duration: const Duration(milliseconds: 500),
                    //           curve: Curves.easeIn,)
                    //     ),
                    //
                    //   ],
                    // ),

                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
              ),
              Container(

                child: Column(

                  children: [

                    Container(
                      // alignment: Alignment.center,

                      child: SvgPicture.asset(
                        "assets/images/Webinar-bro.svg",
                        fit: BoxFit.fill,
                        height: 300,

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ), // -------------------------------------------------------

              Container(
                padding: EdgeInsetsDirectional.all(10),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text(
                      'عبارة عن تطبيق تعليمي يقوم بتقديم الخدمات البرمجية والتعليميه في جميع لغات البرمجة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     SmoothPageIndicator(
                    //         controller:controller,
                    //         count:3,
                    //         effect: WormEffect(
                    //           spacing: 16,
                    //           dotColor: Colors.black26,
                    //           activeDotColor: Colors.teal.shade700,
                    //         ),
                    //         onDotClicked: (index)=>controller.animateToPage(
                    //           index,  duration: const Duration(milliseconds: 500),
                    //           curve: Curves.easeIn,)
                    //     ),
                    //
                    //   ],
                    // ),

                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
              ),
              Container(

                child: Column(

                  children: [

                    Container(
                      // alignment: Alignment.center,

                      child: SvgPicture.asset(
                        "assets/images/Webinar-bro.svg",
                        fit: BoxFit.fill,
                        height: 300,

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ), // -------------------------------------------------------

              Container(
                padding: EdgeInsetsDirectional.all(10),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text(
                      'عبارة عن تطبيق تعليمي يقوم بتقديم الخدمات البرمجية والتعليميه في جميع لغات البرمجة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     SmoothPageIndicator(
                    //         controller:controller,
                    //         count:3,
                    //         effect: WormEffect(
                    //           spacing: 16,
                    //           dotColor: Colors.black26,
                    //           activeDotColor: Colors.teal.shade700,
                    //         ),
                    //         onDotClicked: (index)=>controller.animateToPage(
                    //           index,  duration: const Duration(milliseconds: 500),
                    //           curve: Curves.easeIn,)
                    //     ),
                    //
                    //   ],
                    // ),

                  ],
                ),
              ),
            ],
          ),

              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, "/Login");
              //   },
              //
              //   style: ButtonStyle(
              //     backgroundColor: MaterialStateProperty.all(Colors.blue[700]),
              //     padding: MaterialStateProperty.all(
              //         const EdgeInsets.symmetric(horizontal: 130, vertical: 10)),
              //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(27))),
              //   ),
              //   child: const Text(
              //     "login",
              //     style: TextStyle(fontSize: 24),
              //   ),
              // ),
            ],

          ),




    ),

    bottomSheet: Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: 100,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin:
            EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: ()=>controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,),
              child: Text(
                'Next',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Colors.blue[700]),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 13),
                ),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ),

        ],
      ),

    ),




  );
}

