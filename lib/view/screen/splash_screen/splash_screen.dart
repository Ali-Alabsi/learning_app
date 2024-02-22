import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/Welcome');

    });

    return SafeArea(

      child: Scaffold(


        body: Container(

          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.only(
            top: 100,
            // left: 120,
            // right: 121,
            // bottom: 40,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xFF254CA2), Color(0xFF3F79FC)],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 193,
                height: 167,
                decoration: BoxDecoration(

                  image: DecorationImage(

                    image: AssetImage('assets/images/logo1.png'),

                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 250),
              Container(
                  width: 101,
                  height: 100,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Color(0x00282EAC)),
                  child:SpinKitFadingCircle(
                    color:Colors.white,
                    size:60,
                  )
                // ShapeDecoration(
                //   color: Colors.white,
                //   shape: OvalBorder(),
                // ),

              ),
            ],
          ),

        )
      ),
    );
  }
}