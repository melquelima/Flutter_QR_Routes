import 'package:flutter/material.dart';
import 'package:ronda/app/views/pages/login2.page.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../home/bottom_menu.dart';
import 'login.page.dart';class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  void initState(){
    super.initState();
    validaLogin().then((v){
      if (v){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNav()));
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

Future<bool> validaLogin() async{
  SharedPreferences shared = await SharedPreferences.getInstance();

  return shared.getString("token") != null;
}

}