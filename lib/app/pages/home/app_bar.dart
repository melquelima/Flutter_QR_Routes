// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ronda/app/configs/palette.config..dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        "assets/logo2.png",
        width: 35,
        height: 35,
      ),
      backgroundColor: Palette.customBlue.shade500,
    );
  }
}
