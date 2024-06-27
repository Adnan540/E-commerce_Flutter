import 'package:flutter/material.dart';

import '../helper/constant.dart';

class CatrgoryItemCard extends StatelessWidget {
  CatrgoryItemCard({Key?key,
    required this.customIcon,
    required this.subtitle,
    required this.title,
    required this.onTap
  }) : super(key: key);


  final Icon customIcon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  Constatnt constant = Constatnt();
  @override
  Widget build(BuildContext context) {
    final  double height = constant.deviceHeight(context);//from helper folder
    final  double width =  constant.deviceWidth(context);//from helper folder
    final Color primartTextColor = constant.primaryTextcolor;
    final Color primaryColor = constant.primaryColor;
    final Color secondaryColor = constant.secondaryColor;
    /**item box**/
    return  GestureDetector(
      onTap:onTap,
      child: Container(
        height: 100,
        width: 85,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white70,width: 1,)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            customIcon,
            Text(title,style: TextStyle(color: primartTextColor,fontWeight: FontWeight.bold)),
            Text(subtitle,style: TextStyle(color: primartTextColor))
          ],
        ),
      ),
    );
  }
}
