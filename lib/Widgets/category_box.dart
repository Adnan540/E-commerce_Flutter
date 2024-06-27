import 'package:flutter/material.dart';
import '../Components/category_itemcard.dart';
import '../Helper/constant.dart';
class CategoryBox extends StatelessWidget {
  CategoryBox({Key? key}) : super(key: key);

  final constant = Constatnt();


  @override
  Widget build(BuildContext context) {
    final  double height = constant.deviceHeight(context);//from helper folder
    final  double width =  constant.deviceWidth(context);//from helper folder
    final Color primartTextColor = constant.primaryTextcolor;
    final Color primaryColor = constant.primaryColor;
    final Color secondaryColor = constant.secondaryColor;


    return  Container(
      height:height/4,
      width: width/1,
      color: secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Catrgory",style: TextStyle(color:primartTextColor,fontSize:20 ),),
                Text("View more",style: TextStyle(color: primartTextColor),)
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CatrgoryItemCard(
                  onTap: () {

                  },
                  customIcon:Icon(Icons.local_offer_outlined,color: primartTextColor),
                  title: "Best",
                  subtitle: "Offer",
                ),
                CatrgoryItemCard(
                  onTap: () {

                  },
                  customIcon:Icon(Icons.local_offer_outlined,color: primartTextColor),
                  title: "Best",
                  subtitle: "Offer",
                ),
                CatrgoryItemCard(
                  onTap: () {

                  },
                  customIcon:Icon(Icons.local_offer_outlined,color: primartTextColor),
                  title: "Best",
                  subtitle: "Offer",
                ),
                CatrgoryItemCard(
                  onTap: () {

                  },
                  customIcon:Icon(Icons.local_offer_outlined,color: primartTextColor),
                  title: "Best",
                  subtitle: "Offer",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
