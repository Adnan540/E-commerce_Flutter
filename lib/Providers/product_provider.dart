import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductProvider extends ChangeNotifier {
  List  products = [];
  bool loading = false;
  List  cart = [];
  SharedPreferences? pref;
  bool isLiked = false;
  String? token;
  List productReviews = [];
  bool hasData = false;

  int itemsOnCart = 0;


  Future<void>fetchProductsReviews()async{
    hasData = false;
    loading = true;
    pref =await SharedPreferences.getInstance();
    String? userToken;
    userToken = pref?.getString('token');
    final headers ={
      'Content-Type':'application/json',
      'Accept':'application/json',
      'Authorization':'Bearer $userToken'};
    final route = Uri.parse('http://10.0.2.2:8000/api/product/rev');
    final response = await http.get(route,headers: headers);

    try{
      if(response.statusCode == 200){
        loading =false;
        hasData = true;
        final decodeResponse = convert.jsonDecode(response.body);
        productReviews = List<Map<String,dynamic>>.from(decodeResponse['reviews']);
        print(decodeResponse);
      }

      else{
        throw Exception('failed to fetch reviews${response.body}');
      }
    }
    catch(e){
      print("$e");
    }
  }


//GET request fetchProduct function
  Future<void> fetchProducts() async {
    loading = true;
    final route = Uri.parse('http://10.0.2.2:8000/api/products');
    final headers ={'Content-Type':'application/json',
      'Accept':'application/json'
    };
    try {
      final response = await http.get(
          route,
          headers:headers
      );

      if (response.statusCode == 200) {
        loading = false;
        SharedPreferences pref =await SharedPreferences.getInstance();
        final decodedResponse = convert.jsonDecode(response.body);
        print(decodedResponse);
        products = List<Map<String, dynamic>>.from(decodedResponse['products']);
        Map<String, dynamic> firstProduct = decodedResponse['products'][0];
        // await pref.setInt('productId', firstProduct['id']);
        // await pref.setString('productCategoryId', firstProduct['category_id'].toString());
        // await pref.setString('productName', firstProduct['name']);
        // await pref.setString('productDescription', firstProduct['description']);
        // await pref.setDouble('productPrice',double.parse(firstProduct['price']) );
        // await pref.setString('productImage', firstProduct['image']);
        // await pref.setInt('productStock', firstProduct['stock']);
        notifyListeners();
      }
      else {
        print('failed to fetch products');
      }

    }
    catch (error) {
      throw Exception('Error: $error');
    }
  }

  Map<String,dynamic> getProduct(int productId){
    var product = products.firstWhere((p) =>p['id'] == productId );
    return product;
  }

  void addToCart(int? productId) {
    loading = true;
    if (productId != null) {
      try {
        // Find the product in the products list.
        var product = products.firstWhere((product) => product['id'] == productId);

        // Check if the product is already in the cart.
        var productInCart = cart.firstWhere((p) => p['id'] == productId, orElse: () => <String,dynamic>{});

        if (productInCart.isNotEmpty) {
          // The product is already in the cart. Depending on your requirements, you might want to increment the quantity or ignore the request.
          print("Product is already in the cart.");
        }
        else if (product['stock'] > 0) {
          // The product is in stock. Add it to the cart.
          cart.add(product);
          itemsOnCart++;
          notifyListeners();
          print("Product added to cart.");
        }

        else {
          // The product is out of stock.
          print("Product is out of stock.");
        }

      }
      catch (e) {
        // Handle any errors that might occur.
        print("Error adding product to cart: $e");
      } finally {
        loading = false;
      }
    } else {
      print("invalid product ID.");
    }
  }





// void addToCart({int? userId, int? productId}) {
//   loading = true;
//   if (userId != null && productId != null) {
//     loading = false;
//     // Assuming cart and itemsOnCart are accessible variables.
//     cart.add(products);
//     itemsOnCart++;
//     notifyListeners(); // Assuming you're using a state management system like Provider.
//   }

//    else {
//     print("User not authenticated or invalid product ID.");
//   }

// }

  void addProductToCart(int productId){
    if(productId != null) {
      cart.add(productId);
    }
    notifyListeners();
  }


  void removeFromCart(int? userId,int? productId){
    if(userId != null){
      cart.remove(products);
      itemsOnCart --;
      notifyListeners();
    }
    else{
      print("user not authenticated");
    }

  }



  getUserId()async{
    pref = await SharedPreferences.getInstance();
    return pref?.getInt('user_id');
  }



  getUserToken()async{
    pref = await SharedPreferences.getInstance();
    return pref?.getString('token');
  }



  Future<void> addProductToFav(int productId)async{
    int? userId;
    pref = await SharedPreferences.getInstance();
    userId = pref?.getInt('user_id');
    //int? productId = await getProductId();
    //int? userId = await getUserId();
    final route = Uri.parse('http://10.0.2.2:8000/api/add/fav/');
    final headers = {
      'Content-Type':'application/json',
      'Accept':'application/json',
    };
    final body ={
      'product_id':productId,
      'user_id':userId
    };

    final response = await http.post(
        route,
        headers: headers,
        body: convert.jsonEncode(body)
    );

    try {
      if(response.statusCode == 200){
        print('product added to favourites successfully');
        print(response.body);
        notifyListeners();
      }

      else{
        throw Exception('failed to add product to favourite ${response.statusCode}');
      }
    } on Exception catch (e) {
      print('error $e');
    }
  }







}




