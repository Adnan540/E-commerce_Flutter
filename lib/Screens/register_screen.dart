import 'dart:convert';
import 'package:flutter/material.dart';
import '../Components/login_button.dart';
import '../Components/text_form.dart';
import '../Services/api.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void registerUser() async{
    final data ={
      'email':emailController.text.toString(),
      'name':nameController.text.toString(),
      'password':passwordController.text.toString()
    };
    final result = await API().postRequest(route:'/register', data: data);
    final response = (jsonDecode(result.body));
    if (response['status'] == 200){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          children: [
            /****Welcome section****/
            SizedBox(height: 80,),
            Text("Here to Get",style: TextStyle(fontSize: 35,color: Color(0xff232476),fontWeight: FontWeight.bold)),
            SizedBox(height: 5,),
            Text("Welcomed !",style: TextStyle(fontSize: 30,color: Color(0xff232476),fontWeight: FontWeight.bold),),
            SizedBox(height: 50,),
            /**Name form***/
            TextForm(
              validator:(value){
                if(value!.isEmpty){
                  return "please enter your first name";
                }
                return null;
              },
              hintText: "Name",
              controller:nameController ,
              suffixicon: Icon(Icons.person,color: Colors.black38),
            ),
            SizedBox(height: 20,),
            /**Email form**/
            TextForm(
              validator:(value){
                if(value!.isEmpty){
                  return "please enter your first name";
                }
                return null;
              },
              hintText: "Email",
              controller:emailController,
              suffixicon: Icon(Icons.email,color: Colors.black38),
            ),
            SizedBox(height: 20,),
            /**Password form***/
            TextForm(
              validator:(value){
                if(value!.isEmpty){
                  return "please enter your first name";
                }
                return null;
              },
              hintText: "password",
              controller:passwordController ,
              suffixicon: Icon(Icons.visibility,color: Colors.black38,),
            ),
            SizedBox(height: 50,),
            /**Register button***/
            LoginButton(
              name: "Register ",
              onTap: () {
                registerUser();
              },
            ),
            SizedBox(height: 30,),
            /**Alreay a user***/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Already a user ?",style: TextStyle(fontSize: 18)),
                TextButton(
                  child: Text("Sign in",style: TextStyle(color: Color(0xff232476),fontSize: 18)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>LoginScreen() ,));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
