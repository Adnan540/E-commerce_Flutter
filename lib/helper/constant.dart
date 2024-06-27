import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constatnt{

  double deviceHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  double deviceWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  Color primaryColor = Color(0xff232476);
  Color secondaryColor = Color(0xff0a0f2f);
  Color primaryTextcolor = Colors.white;


}