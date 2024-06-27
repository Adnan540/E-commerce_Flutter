import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Providers/account_provider.dart';
import 'Providers/address_provider.dart';
import 'Providers/cart_provider.dart';
import 'Providers/category_provider.dart';
import 'Providers/favourite_provider.dart';
import 'Providers/home_provider.dart';
import 'Providers/login_provider.dart';
import 'Providers/product_provider.dart';
import 'Providers/user_setting_provider.dart';
import 'Screens/login_screen.dart';
import 'Widgets/bottom_navbar.dart';

void main(){
  runApp(
      MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (context) => LoginProvider(),),
          ChangeNotifierProvider(create: (context) => HomeProvider(),),
          ChangeNotifierProvider(create: (context) => AccountProvider(),),
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(create: (context) => ProductProvider()),
          ChangeNotifierProvider(create: (context) => AddressProvider(),),
          ChangeNotifierProvider(create: (context) => CategoryProvider()),
          ChangeNotifierProvider(create: (context) => FavouriteProvider()),
          ChangeNotifierProvider(create: (context) => UserSettingProvider()),
        ],
        child: const MyApp(),
      )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Some error has occurred');
          } else if (snapshot.hasData) {
            final token = snapshot.data!.getString('token');
            if (token != null) {
              return BottomNav();
            } else {
              return LoginScreen();
            }
          }
          // Add a default return statement in case none of the conditions are met
          return Text('Waiting for data...');
        },
      ),
    );
  }
}

