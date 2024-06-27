
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

class AddressProvider extends ChangeNotifier{
  List addresses = [];
  bool loading = false;
  String? usertoken;
  SharedPreferences? pref;
  bool hasData = false;


  // Future<void>getUserToken()async{
  //   final pref = await SharedPreferences.getInstance();
  //   token = pref.getString("token");
  // }




//get user addresses
  Future<void> fetchAdresses()async{
    pref = await SharedPreferences.getInstance();
    usertoken = pref?.getString('token');
    final headers = {'Content-Type':'application/json',
      'Accept':'application/json',
      'Authorization':'Bearer $usertoken'
    };
    loading = true;
    final route = Uri.parse('http://10.0.2.2:8000/api/ship/address/');
    var response = await http.get(
        route,
        headers: headers
    );
    try {
      loading = false;

      if(response.statusCode == 200){
        addresses = convert.jsonDecode(response.body);
        print(addresses);
        notifyListeners();
      }

      else {
        print(response.body);
        notifyListeners();
      }

    }
    catch(e) {
      print('error occurred $e');
    }
    notifyListeners();
  }



//Add address
  Future<void> addAddress(
      String firstName,
      String lastName,
      String addressLine1,
      String addressLine2,
      String city,
      String state,
      String zipCode,
      String country
      )async {
    final pref = await SharedPreferences.getInstance();
    final int? userId = pref.getInt("user_id");
    final String? token = pref.getString("token");
    final route = Uri.parse('http://10.0.2.2:8000/api/ship/address/');
    final headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    loading = true;
    final response = await http.post(
      route,
      headers: headers,
      body: convert.jsonEncode({
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "address_line_1": addressLine1,
        "address_line_2": addressLine2,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "country": country
      }),
    );

    try {
      if(response.statusCode == 200){
        print("address added successfully");
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('address added ') ));
        print(response.body);
        notifyListeners();
      }
      else{
        throw Exception("error has occured${response.body}");
      }

    }
    catch(e){
      print("error $e");
    }

  }



}//end of ChangeNotifier


