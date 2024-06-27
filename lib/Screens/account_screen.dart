
import 'package:ecommerce_app/Screens/product_review_screen.dart';
import 'package:ecommerce_app/Screens/user_setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../Components/account_listtile.dart';
import '../Providers/account_provider.dart';
import '../Widgets/header_box_account.dart';
import '../helper/constant.dart';
import 'address_screen.dart';
import 'favourite_screen.dart';
import 'login_screen.dart';
import 'my_address_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}
final constant = Constatnt();
class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AccountProvider>(context,listen: false).initializePrefrences();//initialize prefrences
  }

  @override
  Widget build(BuildContext context) {
    AccountProvider _AccountProvider= Provider.of(context);
    final  double height = constant.deviceHeight(context);//from helper folder
    final  double width =  constant.deviceWidth(context);//from helper folder
    final Color primartTextColor = constant.primaryTextcolor;
    final Color primaryColor = constant.primaryColor;
    final Color secondaryColor = constant.secondaryColor;
    return  Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            HeaderBoxAccount(),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(Icons.account_circle_rounded,size:33,color:Colors.black54),
                  SizedBox(width: 10,),
                  Text("Account",style: TextStyle(color:Colors.black38,fontSize: 27 ),)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Column(
              children: [

                AccountListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder:(context) => MyAddressScreen(),)
                    );
                  },
                  title: "My addresses",
                  subtitle: "your addresses",
                  customIcon: Icon(Icons.home_outlined,size: 30,color: Color(0xff8b8c9e),),
                ),
                SizedBox(height: 10,),
                AccountListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder:(context) => FavouriteScreen(),)
                    );
                  },
                  title: "Favourite",
                  subtitle: "your Favourites",
                  customIcon: Icon(Icons.favorite_outline,size: 30,color: Color(0xff8b8c9e),),
                ),

                SizedBox(height: 10,),

                AccountListTile(
                  onTap: () {
                    print("Hello");
                  },
                  title: "Orders",
                  subtitle: "Your orders",
                  customIcon: Icon(Icons.shopping_bag_outlined,size: 30,color: Color(0xff8b8c9e),),
                ),
                SizedBox(height: 10,),
                /**add Address listtile***/
                AccountListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddressScreen(),)
                    );
                  },
                  title: "Add Addresses",
                  subtitle: "Add your addresses here",
                  customIcon: Icon(Icons.location_on_outlined,size: 30,color: Color(0xff8b8c9e),),
                ),
                SizedBox(height: 10,),
                /**Wallet listtile**/
                AccountListTile(
                  onTap: () {
                    print("Hello");
                  },
                  title: "Wallet",
                  subtitle: "Your Wallet",
                  customIcon: Icon(Icons.wallet_rounded,size: 30,color: Color(0xff8b8c9e),),
                ),
                SizedBox(height: 10,),
                //Reviews
                AccountListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>ProductReviewScreen())
                    );
                  },
                  title: "Reviews",
                  subtitle: "All product reviews",
                  customIcon: Icon(Icons.reviews,size: 30,color: Color(0xff8b8c9e),),
                ),
                SizedBox(height:10),
                //settings
                AccountListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>UserSettingScreen())
                    );
                  },
                  title: "Settings",
                  subtitle: "change your app settings",
                  customIcon: Icon(Icons.settings,size: 30,color: Color(0xff8b8c9e),),
                ),
                SizedBox(height: 10,),
                /**Logout**/
                AccountListTile(
                  onTap: () {
                    _AccountProvider.logout();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen(),)
                    );
                  },
                  title: "Logout",
                  subtitle: "leave us!",
                  customIcon: Icon(Icons.logout_outlined,size: 30,color: Color(0xff8b8c9e),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
