import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/product_provider.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProductProvider>(context,listen: false).fetchProductsReviews();

  }
  @override
  Widget build(BuildContext context) {
    ProductProvider _productProvider = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Product review",style: TextStyle(color: Colors.black),),
          centerTitle: true,
          elevation: 0,
        ),
        body: (_productProvider.loading == true && _productProvider.hasData==true)?
        Center(
          child: CircularProgressIndicator(),
        ):
        (_productProvider.loading == false && _productProvider.hasData == false)?
        Center(
            child:Text("add some reviews to show here")
        ):
        //(_productProvider.loading == false && _productProvider.hasData == true)?
        ListView.builder(
          itemCount: _productProvider.productReviews.length,
          itemBuilder: (BuildContext context,int index) {
            final productRevItem = _productProvider.productReviews[index];
            return ListTile(
              leading:Image.network(productRevItem['product']['image'],fit: BoxFit.cover),
              title: Text( "Rating: ${productRevItem['review']}"),
              subtitle: Text("Review:${productRevItem['rating']}"),
            );
          },
        )
    );
  }
}