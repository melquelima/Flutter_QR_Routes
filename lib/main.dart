import 'dart:io';
import 'package:ronda/app/configs/palette.config..dart';
import 'package:flutter/material.dart';
import 'package:ronda/app/views/pages/landing.page.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Api Demo');
    setWindowMinSize(const Size(400, 700));
    //setWindowMaxSize(Size.infinite);
    setWindowMaxSize(const Size(400, 700));
  }
  
  runApp(const ApWidget());
}

class ApWidget extends StatelessWidget {
  const ApWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Palette.customBlue.shade50,
          primarySwatch: Palette.customBlue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      home: const LandingPage(),
    );
  }
}



