import 'package:flutter/material.dart';
class WelcomeBox extends StatelessWidget {
  const WelcomeBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 250,
      width: double.infinity,
      decoration:BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30) ),
        color: Color(0xff232476),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text("Again !",style: TextStyle(color: Colors.white,fontSize: 25),)
        ],
      ),
    );
  }
}
