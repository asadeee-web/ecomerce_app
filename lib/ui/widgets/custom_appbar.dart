import 'package:ecomerce/core/constants/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(title, style: style28Bold),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(CupertinoIcons.bell, color: Colors.black, size: 28),
              // Optional notification dot
              Positioned(
                right: 0,
                top: 2,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
