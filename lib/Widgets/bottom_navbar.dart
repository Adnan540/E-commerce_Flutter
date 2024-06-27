
import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import '../Screens/account_screen.dart';
import '../Screens/category_screen.dart';
import '../Screens/home_screen.dart';
class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CategoryScreen(),
    AccountScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ) ,
        bottomNavigationBar: FlashyTabBar(
          animationCurve: Curves.linear,
          selectedIndex: _selectedIndex,
          iconSize: 30,
          showElevation: false,
          onItemSelected: _onItemTapped,
          items: [
            FlashyTabBarItem(
                icon: Icon(Icons.home_outlined),
                title: Text('Home')
            ),
            FlashyTabBarItem(
                icon: Icon(Icons.category_outlined),
                title: Text('Categories')
            ),
            FlashyTabBarItem(
                icon: Icon(Icons.account_circle_rounded),
                title: Text('Account')
            ),

          ],
        )
    );
  }
}



