import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UserSettingProvider extends ChangeNotifier{
  SharedPreferences? pref;
  String? userToken;
  int? userId;

  Future<void> changeUserData(userName,userEmail)async{
    pref =await SharedPreferences.getInstance();
    userToken = pref?.getString('token');
    userId = pref?.getInt('user_id');
    final route = Uri.parse('http://10.0.2.2:8000/api/user/$userId');
    final headers = {
      'Content-Type':'application/json',
      'Accept':'application/json',
      'Authorization':'Bearer $userToken'
    };
    final bodyData = convert.jsonEncode(
        {
          'name':userName,
          'email':userEmail
        }
    );
    final response = await http.put(
        route,
        headers:headers,
        body: bodyData
    );

    try{
      if(response.statusCode == 200){
        pref?.setString('name',userName);
        pref?.setString('email',userEmail);

        print("PUT request set successfully");
        print('Response = ${response.body}');
      }

      else{
        print("error has been occurred ${response.body}");
      }

    }

    catch(e){
      print('$e');
    }
  }


}