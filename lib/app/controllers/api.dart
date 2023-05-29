import 'package:dio/dio.dart';
import 'package:ronda/app/modules/auth.dart';
import 'package:flutter/cupertino.dart';

class ApiController extends ChangeNotifier {

  static Future<AuthApp> loginApp(String user, String pwd) async {
    String urlBase = "localhost:6000";
    final Response response = await Dio().post('$urlBase/api/login',
        options:
            Options(headers: <String, dynamic>{'Authorization': "$user:$pwd"}));

    final data = AuthApp.fromJson(
      response.data,
    );

    return data;
  }

}

String a = "";
