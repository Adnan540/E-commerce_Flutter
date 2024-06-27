import 'package:flutter/material.dart';
import 'dart:core';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Components/login_button.dart';
import '../Helper/constant.dart';
import '../Providers/cart_provider.dart';
import '../Providers/favourite_provider.dart';
import '../Providers/product_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({
    Key? key,
    required this.selectedProduct
  });

  final Map<String,dynamic> selectedProduct;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  SharedPreferences? pref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProductProvider>(context,listen: false).getUserToken();
  }


  Constatnt constant = Constatnt();


  @override
  Widget build(BuildContext context) {
    final height = constant.deviceHeight(context);
    final width = constant.deviceWidth(context);
    final Color primartTextColor = constant.primaryTextcolor;
    final Color primaryColor = constant.primaryColor;
    final Color secondaryColor = constant.secondaryColor;
    ProductProvider _productProvider = Provider.of(context);
    FavouriteProvider _favProvider = Provider.of(context);
    CartProvider _cartProvider = Provider.of(context);
    return
      Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor:primaryColor ,
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: height/3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage('${widget.selectedProduct['image']}'),fit: BoxFit.cover)
                  ),
                ),
                SizedBox(height: 10,),
                Text( '${widget.selectedProduct['name']}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('${widget.selectedProduct['description']}',style: TextStyle(fontSize: 15),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("add to favourite",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                    IconButton(
                      icon:Icon(
                        _productProvider.isLiked? Icons.favorite : Icons.favorite_border_outlined,
                        size: 30,
                        color: _productProvider.isLiked ? Colors.red : Colors.black,
                      ),
                      onPressed: () {
                        _productProvider.addProductToFav(widget.selectedProduct['id']);
                      },
                    )

                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Price:',style: TextStyle(fontSize:17,fontWeight: FontWeight.bold),),
                    Text('\$${widget.selectedProduct['price']}',style: TextStyle(fontSize: 15,color: Colors.green),),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('in Stock:',style: TextStyle(fontSize:17,fontWeight: FontWeight.bold),),
                    Text('${widget.selectedProduct['stock']} items',style: TextStyle(fontSize: 15),),
                  ],
                ),
                SizedBox(height:10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Reviews:",style: TextStyle(fontSize:17,fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Show all reviews",style: TextStyle(color:primaryColor,fontSize: 15)),
                        IconButton(
                          icon: Icon(Icons.reviews_outlined),
                          onPressed: () {

                          },
                        )
                      ],
                    )

                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround ,
                  children: [
                    Text('Ratings:',style: TextStyle(fontSize:17,fontWeight: FontWeight.bold),),
                    Container(
                      height: 40,
                      width: 240,
                      child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.star_border,color: Colors.amber,size: 30,),
                              onPressed: () {
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.star_border,color: Colors.amber,size: 30,),
                              onPressed: () {
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.star_border,color: Colors.amber,size: 30,),
                              onPressed: () {
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.star_border,color: Colors.amber,size: 30,),
                              onPressed: () {
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.star_border,color: Colors.amber,size: 30,),
                              onPressed: () {
                              },
                            )
                          ]),
                    ),

                  ],
                ),
                SizedBox(height: 30,),
                //add to cart button
                Container(
                  height: 50,
                  width: width/1,
                  child: LoginButton(
                    name: "Add to cart",
                    onTap: () async{
                      _productProvider.addToCart(widget.selectedProduct['id']);
                    },
                  ) ,
                ),
              ],
            ),
          )
      );
  }
}
