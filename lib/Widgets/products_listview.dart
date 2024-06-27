
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/product_provider.dart';
import '../Screens/product_detail_screen.dart';

class ProductsListview extends StatelessWidget {
  const ProductsListview({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        if (productProvider.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: productProvider.products.length,
            itemBuilder: (context, index) {
              final product = productProvider.products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProductDetailScreen(selectedProduct:product),)
                  );
                },
                child: ListTile(
                  title: Text(
                    productProvider.products[index]['product_name'] ?? 'no name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productProvider.products[index]['product_description'] ?? 'no description',
                      ),
                      Text(
                        'Price: ${productProvider.products[index]['product_price']}' ?? 'no price',
                      ),
                      Text(
                        'Stock: ${productProvider.products[index]['product_stock']}' ?? 'no stock',
                      ),
                    ],
                  ),
                  leading: Image.network(
                    productProvider.products[index]['product_image'] ?? 'no image',
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
