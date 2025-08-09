import 'package:ecomerce/ui/screens/oboarding/onboarding_screen.dart';
import 'package:ecomerce/ui/screens/root/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart'
    show GetMaterialApp;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: "Poppins"),

      home: const RootScreen(),
    );
  }
}
