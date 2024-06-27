import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Helper/constant.dart';
import '../Providers/category_provider.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}


Constatnt constant = Constatnt();
class _CategoryScreenState extends State<CategoryScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CategoryProvider>(context,listen: false).getUserToken();
    Provider.of<CategoryProvider>(context,listen: false).fetchCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    CategoryProvider _categoryProvider = Provider.of(context);
    final Color primaryColor=constant.primaryColor;
    return Scaffold(
        appBar: AppBar(
          title:Text("Categories"),
          centerTitle: true,
          elevation: 0,
          backgroundColor:primaryColor ,
          actions: [
            IconButton(
              icon:Icon(Icons.shopping_cart_outlined),
              onPressed: () {
              },
            )
          ],
        ),
        body:(_categoryProvider.isLoading == true)?
        Center(child: CircularProgressIndicator(),)
            :GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1/1.4,
            crossAxisSpacing: 10,
            mainAxisSpacing:10 ,
          ),

          itemCount: _categoryProvider.categoryItems.length,
          itemBuilder: (context, index) {
            final categoryItems =_categoryProvider.categoryItems[index];

            return Column(
              children: [
                Image.network('https://www.beatsbydre.com/content/dam/beats/web/product/headphones/studiopro-wireless/pdp/product-carousel/black/pc-studiopro-black-thrqtr-right.jpg'),
                Text('${categoryItems['name']}'),
              ],
            );
          },
        )
    );
  }
}