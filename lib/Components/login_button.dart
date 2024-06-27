import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginButton extends StatelessWidget {
  LoginButton({
    required this.name,
    required this.onTap
  });
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          color: Color(0xff232476),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 20,),
            Text(name,style: TextStyle(color: Colors.white,fontSize: 25),),
            Icon(Icons.arrow_forward,color: Colors.white,size: 35,)
          ],
        ),
      ),
    );
  }
}
