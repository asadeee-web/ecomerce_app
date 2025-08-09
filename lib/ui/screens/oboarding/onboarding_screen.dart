import 'package:ecomerce/ui/screens/root/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 16, top: 40),
            child: Text(
              "Define yourself in your unique way.",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                height: 0.9, // Reduce line spacing
              ),
            ),
          ),
          Image.asset("assets/onboarding_element.png"),
          Image.asset("assets/onboarding_image.png", fit: BoxFit.cover),
          GestureDetector(
            onTap: () {
              Get.to(
                transition: Transition.native,
                duration: Duration(milliseconds: 600),
                RootScreen(),
              );
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Let\'s Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),

          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     width: double.infinity,
          //     height: 80,
          //     decoration: BoxDecoration(color: Colors.white),
          //     child: Center(
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 16),
          //         child: SmartButtonAlt(
          //           width: double.infinity,
          //           backgroundColor: Colors.black,

          //           //icon: Icon(Icons.arrow_forward, color: Colors.white),
          //           label: 'Lets Get Started',
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => RootScreen()),
          //             );
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
