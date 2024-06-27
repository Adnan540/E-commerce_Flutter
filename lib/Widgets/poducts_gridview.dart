import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/product_provider.dart';
import '../Screens/product_detail_screen.dart';
class ProductGridView extends StatefulWidget {
  const ProductGridView({super.key});

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, productProvider, child) {
      // if(productProvider.loading){
      //   return Center(
      //     child: CircularProgressIndicator(),
      //   );
      // }
      //
      // else{
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1/1.4,
            crossAxisSpacing: 10,
            mainAxisSpacing:10 ,
          ),

          itemCount:productProvider.products.length,
          itemBuilder: (BuildContext context,int index) {
            final product = productProvider.products[index];
            return GestureDetector(
                onTap:() {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProductDetailScreen(selectedProduct: product,),)
                  );
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(product['image'],fit: BoxFit.cover),

                      Text(
                        product['name'] ?? 'no description',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),
                      ),
                      SizedBox(height: 10,),

                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.attach_money_outlined,size: 17,),
                              Text( 'Price:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                            ],
                          ),
                          SizedBox(width: 5,),
                          Text('\$${product['price']}' ?? 'no price',style: TextStyle(color: Colors.green), )
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.shopping_basket_outlined,size: 17,),
                              Text( 'Stock:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                            ],
                          ),
                          SizedBox(width: 5,),
                          Text('${product['stock']} items' ?? 'not found' )
                        ],
                      ),
                    ],
                  ),
                )
            );
          },
        );
    }
    );
  }
}