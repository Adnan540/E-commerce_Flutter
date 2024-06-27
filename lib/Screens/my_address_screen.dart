import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Providers/address_provider.dart';
class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  State<MyAddressScreen> createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  int? userId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Provider.of<AddressProvider>(context,listen: false).getUserToken();
    Provider.of<AddressProvider>(context,listen: false).fetchAdresses();

  }

  // Future<void> fetchUserIdAndAddresses() async {
  //   SharedPreferences? prefs;
  //   prefs =await SharedPreferences.getInstance();
  //   userId =prefs.getInt('id');
  //   if (userId != null) {
  //     Provider.of<AddressProvider>(context, listen: false).fetchAdresses(userId!);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    AddressProvider _addressProvider = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("My addresses",style: TextStyle(color: Colors.black)),
        ),
        body: (_addressProvider.loading == true &&_addressProvider.hasData)?
        Center(
          child:
          CircularProgressIndicator(),
        ):
        Consumer<AddressProvider>(builder: (context, _addressProvider, child) {
          return ListView.builder(
            itemCount: _addressProvider.addresses.length,
            itemBuilder: (BuildContext context, int index) {
              final address = _addressProvider.addresses[index];
              return ListTile(
                title: Text('state: ${address['address_line_1']}'),
                subtitle: Text('City: ${address['city']}'),
              );
            },
          );

        },)
    );
  }
}
