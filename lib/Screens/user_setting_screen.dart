import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/login_button.dart';
import '../Components/text_form.dart';
import '../Providers/user_setting_provider.dart';

class UserSettingScreen extends StatefulWidget {
  const UserSettingScreen({super.key});

  @override
  State<UserSettingScreen> createState() => _UserSettingScreenState();
}
TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();

class _UserSettingScreenState extends State<UserSettingScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Provider.of<UserSettingProvider>(context,listen: false).changeUserData(nameController.text,emailController.text);
  }

  void _onSubmit(){
    if(_formKey.currentState!.validate()){
      Provider.of<UserSettingProvider>(context,listen:false).changeUserData(nameController.text, emailController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    UserSettingProvider _userSettingProvider = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Change User data",style: TextStyle(color: Colors.black),),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body:Form(
          key: _formKey,
          child:Padding(
            padding: const EdgeInsets.all(23.0),
            child: Column(
                children: [
                  //name
                  TextForm(
                    controller:nameController ,
                    hintText: "Change yor name",
                    suffixicon:Icon(Icons.person_3_outlined,color: Colors.black45,),
                    validator:(value) {
                      if(value!.isEmpty){
                        return "please enter your name";
                      }
                      return null;
                    },

                  ),
                  SizedBox(height: 20,),
                  //email
                  TextForm(
                    controller:emailController ,
                    hintText: "Change your email",
                    suffixicon:Icon(Icons.email_outlined,color: Colors.black54,),
                    validator:(value) {
                      if(value!.isEmpty){
                        return "please enter your email";
                      }
                      return null;

                    },
                  ),
                  SizedBox(height: 20,),
                  LoginButton(
                    name: "Submit",
                    onTap: () {
                      _onSubmit();
                    },
                  )
                ]
            ),
          ),
        )
    );
  }
}