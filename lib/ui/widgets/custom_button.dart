import 'package:ecomerce/core/constants/textStyle.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart' show Provider;

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;
  final String text;
  final Color backgroundColor;
  final Color? textColor;
  final Color? loaderColor;

  const CustomButton({
    super.key,
    required this.onTap,
    this.isLoading = false,
    required this.text,
    this.backgroundColor = Colors.white,
    this.textColor,
    this.loaderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: backgroundColor, blurRadius: 8, spreadRadius: 2),
          ],
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(color: Colors.white),
              )
            : Text(text, style: style16Bold.copyWith(color: Colors.black)),
      ),
    );
  }
}
