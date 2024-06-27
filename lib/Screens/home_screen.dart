import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/constant.dart';
import '../Providers/home_provider.dart';
import '../Providers/product_provider.dart';
import '../Widgets/header_box_home.dart';
import '../Widgets/poducts_gridview.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProductProvider>(context,listen: false).getUserToken();
    Provider.of<ProductProvider>(context,listen: false).fetchProducts();
    Provider.of<HomeProvider>(context,listen: false).getUserData();

  }


  // Future<void> fetchTokenAndProducts() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   token = prefs.getString('token');
  //   if (token != null) {
  //     Provider.of<ProductProvider>(context, listen: false).fetchProducts(token);
  //   }
  // }


  Constatnt constant = new Constatnt();//create new object

  @override
  Widget build(BuildContext context){
    final Color primaryColor = constant.primaryColor;
    HomeProvider _HomeProvider = Provider.of(context); //define HomeProvider as _HomeProvider


    return Scaffold(
      body: SafeArea(
          child: (_HomeProvider.isLoading)? Center(child: CircularProgressIndicator(),):
          ListView(
              children: [
                HeaderBoxHome(),

                SizedBox(height: 10,),

                //product text
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:  Container(
                      height: 30,
                      width: 200,
                      margin: EdgeInsets.only(left: 70,right: 70),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Popular Products",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                        ],
                      )
                  ),
                ),

                SizedBox(height: 10,),

                //products gridview
                SizedBox(
                  height: 400,
                  child: ProductGridView(),
                ),

              ]
          )
      ),
    );
  }
}
