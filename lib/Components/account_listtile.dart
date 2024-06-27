import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountListTile extends StatelessWidget {
  const AccountListTile({Key? key,
    required this.title,
    required this.customIcon,
    required this.subtitle,
    required this.onTap
  }) : super(key: key);
  final String title;
  final String subtitle;
  final Icon customIcon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: onTap,
      child: ListTile(
        /**Leading section***/
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color:Color(0xffeaeaf2),
            borderRadius:BorderRadius.circular(10),
          ),
          child: customIcon,
        ),
        title: Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff444a60))),
        subtitle: Text(subtitle,),
        trailing: Icon(Icons.arrow_forward,color: Colors.grey,size: 28,),
      ),
    );
  }
}
