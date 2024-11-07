import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:yoursportz/view/Language_screen.dart';
import 'package:yoursportz/view/Login_screen.dart';
import 'package:yoursportz/view/Splash_screen.dart';
import 'package:yoursportz/view/Your_information_screen.dart';

import 'models/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashColor()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashScreen(),
      ),
    );
  }
}