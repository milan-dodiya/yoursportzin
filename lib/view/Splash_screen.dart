import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yoursportz/models/colors.dart';

import 'OntimeSplash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>OntimeSplash()), // Replace with your target screen
      );
    });

    return Scaffold(
      body: Consumer<SplashColor>(
        builder: (BuildContext context, value, Widget? child) {
          return AnimatedContainer(
            duration: Duration(seconds: 1),
            decoration: BoxDecoration(
              gradient: LinearGradient(begin:Alignment.topCenter,end: Alignment.bottomCenter,colors:
                value.backgroundGradientColors,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage("assets/images/apple-icon 2.png",),height:101,width:101,),
                  Text("YourSportz",style:TextStyle(fontSize:24,color:value.textColor),),
                  Text("Game it your way",style: TextStyle(fontSize:12,color: value.textColor),),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}