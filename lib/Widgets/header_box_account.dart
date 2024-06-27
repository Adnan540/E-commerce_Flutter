import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Helper/constant.dart';
import '../Providers/account_provider.dart';

class HeaderBoxAccount extends StatelessWidget {
  HeaderBoxAccount({Key? key}) : super(key: key);
  final constant = Constatnt();
  @override
  Widget build(BuildContext context) {

    AccountProvider _AccountProvider= Provider.of(context);
    final  double height = constant.deviceHeight(context);//from helper folder
    final  double width =  constant.deviceWidth(context);//from helper folder
    final Color primartTextColor = constant.primaryTextcolor;
    final Color primaryColor = constant.primaryColor;
    final Color secondaryColor = constant.secondaryColor;

    return   Container(
      height: height/3,
      width: width/1,
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40,),
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage('https://newsmileatlanta.com/wp-content/uploads/2019/03/portrait-of-beautiful-woman.jpg'),
          ),
          SizedBox(height: 10,),
          Text("${_AccountProvider.preferences?.getString('name') ?? 'Default name'}",style: TextStyle(color:primartTextColor,fontWeight:FontWeight.bold)),          SizedBox(height: 5,),

          Text("${_AccountProvider.preferences?.getString('email') ?? 'Default email'}",style: TextStyle(color:Colors.white70,)),        ],
      ),
    );
  }
}
