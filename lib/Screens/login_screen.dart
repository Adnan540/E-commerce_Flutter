import 'dart:convert';
import 'package:ecommerce_app/Screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Components/login_button.dart';
import '../Components/text_form.dart';
import '../Components/welcome_box.dart';
import '../Services/api.dart';
import '../Widgets/bottom_navbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  /**Login function***/
  void loginUser(String email, String password) async{

    final Map<String,String> data ={
      'email':email,
      'password':password
    };
    final result = await API().postRequest(route:'/loginn', data: data);
    final response = jsonDecode(result.body);
    try{
      if (response['status'] == 200){
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setInt('user_id', response['user']['id']);
        await preferences.setString('name',response['user']['name']);
        await preferences.setString('token', response['token']);
        await preferences.setString('email', response['user']['email']);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response['message']),));


        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => BottomNav(),//bottom nav is home page
          ),
        );
      }else{
        print(response['message']);
      }
    }catch(e){print(e);}

  }
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.all(23.0),
        child:Column(
          children: [
            /**Welcome box**/
            WelcomeBox(),
            SizedBox(height: 40,),
            /**Email form***/
            TextForm(
              validator:(value){
                if(value!.isEmpty){
                  return "please enter your first name";
                }
                return null;
              },
              controller:emailController,
              hintText: "Example@gmail.com",
              suffixicon: Icon(Icons.email,color: Colors.black38,),),
            SizedBox(height: 20,),
            /***Password form**/
            TextForm(
              validator:(value){
                if(value!.isEmpty){
                  return "please enter your first name";
                }
                return null;
              },
              controller:passwordController,
              hintText: "password",
              suffixicon: Icon(Icons.visibility,color: Colors.black38,),
            ),
            SizedBox(height: 40,),
            /***Login button**/
            LoginButton(
              name: "Login",
              onTap:() {
                loginUser(
                    emailController.text,passwordController.text
                );
                // Navigator.pushReplacement(context,
                // MaterialPageRoute(builder: (context) => HomeScreen(),));

              },
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Not a user yet ?",style: TextStyle(fontSize: 18)),
                /**Register button**/
                TextButton(
                  child:Text("Register now",style: TextStyle(color: Color(0xff232476),fontSize: 18)) ,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegisterScreen())
                    );
                  },
                )
              ],
            )
          ],
        ) ,
      ),
    );
  }
}
