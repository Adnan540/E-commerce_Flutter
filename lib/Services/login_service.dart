import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/login_model.dart';
class LoginService{
  final loginUrl =Uri.parse('http://10.0.2.2:8000/api/login');
  final headers = {
    'Authorization':'Bearer',
    'Content-Type':'application/json'
  };

  Future<LoginModel> authLogin()async{
    final response = await http.post(loginUrl,headers:headers);

    if(response.statusCode == 200)
    {
      return LoginModel.fromjson(jsonDecode(response.body));
    }
    else{
      throw Exception('Login failed');
    }


  }

}








