
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Helper/constant.dart';
import '../Providers/home_provider.dart';
import '../Screens/cart_screen.dart';
class HeaderBoxHome extends StatelessWidget {
  HeaderBoxHome({Key? key}) : super(key: key);

  Constatnt constant = Constatnt();//create new object
  @override
  Widget build(BuildContext context) {
    HomeProvider _HomeProvider = Provider.of(context); //define HomeProvider as _HomeProvider
    final  double height = constant.deviceHeight(context);//from helper folder
    final  double width =  constant.deviceWidth(context);//from helper folder
    final Color primartTextColor = constant.primaryTextcolor;
    final Color primaryColor = constant.primaryColor;
    final Color secondaryColor = constant.secondaryColor;
    return Container(
      height: height/3.3,
      width: width/1,
      color: primaryColor,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /**Welcome section**/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Column(
                    children: [
                      Text("Welcome, ${_HomeProvider.preferences?.getString('name').toString()}"??'no name',style: TextStyle(color:primartTextColor,fontSize:30,fontWeight: FontWeight.bold),),
                      SizedBox(height: 70,),
                      /**Search bar***/
                      SearchBar(
                        leading: Icon(Icons.search),
                        hintText: "Search any product",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          /**Cart icon**/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [

                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CartScreen(),)
                    );

                  },
                  icon: Icon(Icons.shopping_cart,color: primartTextColor,),
                )
              ],
            ),
          ),
          /**Message icon***/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                  },
                  icon: Icon(Icons.message,color: primartTextColor,),
                )
              ],
            ),
          ),
        ],
      ) ,
    );
  }
}
