import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

class CategoryProvider extends ChangeNotifier{

  List categoryItems = [];
  bool isLoading = false;
  SharedPreferences? pref;
  String? token;


  void getUserToken()async{
    pref = await SharedPreferences.getInstance();
    token = pref?.getString('token');
  }


  Future<void> fetchCategoryList()async{
    String? userToken;
    pref = await SharedPreferences.getInstance();
    userToken = pref?.getString('token');

    final headers = {
      'Content-Type':'application/json',
      'Accept':'application/json',
      'Bearer':'$userToken'
    };

    final route = Uri.parse('http://10.0.2.2:8000/api/category/');
    final response = await http.get(route,headers:headers);

    try{

      if(response.statusCode == 200){
        final decodedResponse = convert.jsonDecode(response.body);
        categoryItems = convert.jsonDecode(response.body);
        print(categoryItems);
      }

      else{
        throw Exception('failed to fetch category data');
      }
    }

    catch(e){
      print('error $e');
    }

  }






}