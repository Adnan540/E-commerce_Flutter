import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/cart_provider.dart';
import '../Providers/product_provider.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    ProductProvider _productProvider = Provider.of(context);
    CartProvider _cartProvider = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart Screen"),
          centerTitle: true,
        ),
        body:(_productProvider.loading == true)?
        Center(
          child: CircularProgressIndicator(),
        ):
        ListView.builder(
          itemCount:_productProvider.cart.length ,
          itemBuilder: (BuildContext context,int index) {
            var cartItem = _productProvider.cart[index];
            print(cartItem);
            return
              ListTile(
                title:Text("title ${cartItem['name']}"?? "no") ,
                subtitle: Text("description${cartItem['description']}"??"no"),
              );
          },
        )

    );
  }
}
