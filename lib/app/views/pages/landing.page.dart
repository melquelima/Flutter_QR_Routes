import 'package:flutter/material.dart';
import 'package:ronda/app/controllers/app_controller.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../home/bottom_menu.dart';
import 'login2.page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  void initState(){
    super.initState();
    AppController.instance.validaLogin().then((v){
      if (v){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const BottomNav()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage2()));
      }
    });
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

}