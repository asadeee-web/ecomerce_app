import 'package:ecomerce/ui/home/home_screen.dart';
import 'package:ecomerce/ui/oboarding/onboarding_screen.dart';
import 'package:ecomerce/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart'
    show GetMaterialApp;
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: "Poppins Bold"),

      home: const OnboardingScreen(),
    );
  }
}
