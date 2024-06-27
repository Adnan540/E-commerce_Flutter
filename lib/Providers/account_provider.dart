import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountProvider extends ChangeNotifier{
  SharedPreferences? preferences;









  Future<void> initializePrefrences() async{
    preferences = await SharedPreferences.getInstance();
    notifyListeners();
  }

  void logout(){
    preferences!.clear();
    notifyListeners();
  }

}