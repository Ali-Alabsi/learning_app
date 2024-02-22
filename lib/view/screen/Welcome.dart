import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class Welcome extends StatelessWidget {
   Welcome({Key? key}) : super(key: key);
  final controller = PageController();
  void dispose() {
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: PageView(
        controller: controller,
          children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: height * .5,
                width: width ,
                child: SvgPicture.asset('assets/svg/on_boarding1.svg' ,fit: BoxFit.cover)
              ),

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
              SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                      controller:controller,
                      count:3,
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.teal.shade700,
                      ),
                      onDotClicked: (index)=>controller.animateToPage(
                        index,  duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,)
                  ),

                ],
              ),
              SizedBox(),
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
              SizedBox(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: height * .5,
                  width: width ,
                  child: SvgPicture.asset('assets/svg/on_boarding2.svg' ,fit: BoxFit.cover)
              ),

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
              SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                      controller:controller,
                      count:3,
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.teal.shade700,
                      ),
                      onDotClicked: (index)=>controller.animateToPage(
                        index,  duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,)
                  ),

                ],
              ),
              SizedBox(),
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
              SizedBox(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: height * .5,
                  width: width ,
                  child: SvgPicture.asset('assets/svg/on_boarding3.svg' ,fit: BoxFit.cover)
              ),

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
              SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                      controller:controller,
                      count:3,
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.teal.shade700,
                      ),
                      onDotClicked: (index)=>controller.animateToPage(
                        index,  duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,)
                  ),

                ],
              ),
              SizedBox(),
              Container(
                width: double.infinity,
                margin:
                EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: (){
                    // Get.to(Login());
                    Get.offNamed("/Login");
                  },
                  child: Text(
                    'Next To Page',
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
              SizedBox(),
            ],
          ),
        ),
          ]
          ),

        ),

      ),
    );
  }
}
