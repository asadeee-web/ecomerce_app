import 'package:flutter/material.dart';

BoxDecoration customShadowDecoration(int i, {double? radius, Color? color}) {
  return BoxDecoration(
    color: color ?? Colors.white,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: Colors.white,
        blurRadius: radius ?? 1, // dynamic blur radius
        spreadRadius: radius ?? 1 / 4, // optional tweak
      ),
    ],
  );
}
