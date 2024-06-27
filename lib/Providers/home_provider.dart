import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeProvider extends ChangeNotifier{
  SharedPreferences? preferences;
  bool isLoading = true;
  List products = [];
  List item = [];







  void removeFromCart(){

  }


  void addToCart(){

  }


  void getUserData()async{
    preferences = await SharedPreferences.getInstance();
    isLoading = false;
  }


}