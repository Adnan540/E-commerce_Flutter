import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';



class FavouriteProvider extends ChangeNotifier{
  SharedPreferences? pref;
  List<Map<String,dynamic>>favouriteList = [];
  bool isLoading = false;
  bool isPressed = false;
  bool hasData = false;
  String? token;








  getUserId()async{
    pref = await SharedPreferences.getInstance();
    pref?.getInt('user_id');
    notifyListeners();
  }


  getUserToken()async{
    pref = await SharedPreferences.getInstance();
    pref?.getString('token');
    notifyListeners();
  }



//fetch favourite list
  Future<void> fetchFavoutieList()async{
    isLoading = true;
    hasData = false;
    String? userToken;
    pref = await SharedPreferences.getInstance();
    userToken = pref?.getString('token');
    //userToken =await getUserToken();
    final route = Uri.parse('http://10.0.2.2:8000/api/wish');
    final headers = {'Content-Type':'application/json' ,
      'Accept':'applicaton/json',
      'Authorization':'Bearer $userToken'
    };
    final response = await http.get(route,headers:headers);

    try{

      if(response.statusCode == 200){
        isLoading = false;
        hasData = true;
        final  decodedResponse = convert.jsonDecode(response.body);
        favouriteList = List<Map<String,dynamic>>.from(decodedResponse['wishlists']);
        print(response.body);
        notifyListeners();
      }

      else{
        throw Exception('error occured');
      }
    }
    catch(e){
      print('error $e');
      notifyListeners();
    }


  }





}