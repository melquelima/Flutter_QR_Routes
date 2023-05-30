import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ronda/app/pages/login.page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/user.model.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  Auth auth = Auth.empty();

  Future<bool> Login(user, pwd) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    var url = Uri.parse("http://menezesapolinario.ddns.net:4000/login");

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'authorization': 'Basic ${base64Encode(utf8.encode('${user}:${pwd}'))}',
    };

    var resposta = await http.get(url, headers: requestHeaders);

    if (resposta.statusCode == 200) {
      var obj = jsonDecode(resposta.body);
      shared.setString("auth", resposta.body);
      print("OK");
      print(obj);
      auth = Auth.fromJson(jsonDecode(resposta.body));
      // shared.setString("user", jsonDecode(resposta.body)["user"]);
      return true;
    } else {
      print("NOK");
      print(resposta.body);
      return false;
    }
  }

  Future<void> logout(context) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.remove("auth");
    GoRouter.of(context).push('/login');
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage2()));
  }

  Future<bool> validaLogin() async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    var jsonString = shared.getString("auth");
    if (jsonString == null) return false;

    auth = Auth.fromJson(jsonDecode(jsonString));

    return true;
  }
}
