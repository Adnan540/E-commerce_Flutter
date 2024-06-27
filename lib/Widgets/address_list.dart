import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/address_provider.dart';

class AddressList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddressProvider>(
      builder: (context, addressProvider, child) {
        if (addressProvider.loading) {
          return CircularProgressIndicator();
        } else {
          return ListView.builder(
            itemCount: addressProvider.addresses.length,
            itemBuilder: (context, index) {
              var address = addressProvider.addresses[index];
              return ListTile(
                title: Text(address['state']), // adjust this line based on the structure of your address data
                subtitle: Text(address['city']), // adjust this line based on the structure of your address data
              );
            },
          );
        }
      },
    );
  }
}