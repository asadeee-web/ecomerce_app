import 'package:flutter/material.dart';

class CustomTextFieldContainer extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final int maxLength;
  final Color backgroundColor;
  final Color textColor;
  final Color hintTextColor;
  final Color counterColor;

  const CustomTextFieldContainer({
    super.key,
    required this.controller,
    this.hintText = "Enter text...",
    this.maxLines = 4,
    this.maxLength = 300,
    this.backgroundColor = const Color(0xFF333333),
    this.textColor = Colors.white,
    this.hintTextColor = Colors.white70,
    this.counterColor = Colors.white70,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.white, blurRadius: 6, spreadRadius: 0.8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            maxLength: maxLength,
            style: TextStyle(color: textColor, fontSize: 16),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: hintTextColor),
              border: InputBorder.none,
              counterStyle: TextStyle(color: counterColor),
            ),
            cursorColor: textColor,
          ),
        ],
      ),
    );
  }
}
