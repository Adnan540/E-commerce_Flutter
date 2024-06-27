import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/address_model.dart';

class AddressService{

  addAddress(AddressModel address) async {

    final url = Uri.parse('http://10.0.2.2:8000/api/ship/address');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? userId = preferences.getInt('user_id');

    try{
      final response = await http.post(
          url,
          headers: {'Content-Type':'application/json'},
          body: jsonEncode({
            'user_id':userId,
            'first_name': address.firstName,
            'last_name': address.lastName,
            'address_line_1': address.addressLine1,
            'address_line_2': address.addressLine2,
            'city': address.city,
            'country': address.country,
            'state': address.state,
            'zip_code':address.zipCode
          })
      );
      if(response.statusCode == 200){
        print("Address added Successfuly");
      }
      else{
        print("Failed to add address");
      }
    }
    catch(e){
      print('error $e');
    }
  }


  Future<AddressModel> fetchAddress()async{
    final url = Uri.parse('http://10.0.2.2:8000/api/ship/address');
    final response = await http.get(url);
    if(response.statusCode == 200){
      final Map<String,dynamic> data = jsonDecode(response.body);
      final address = AddressModel.fromJson(data);
      return address;
    }
    else{
      throw Exception('failed to fetch data');
    }

  }
}