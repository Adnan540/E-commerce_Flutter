import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Providers/favourite_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<FavouriteProvider>(context,listen: false).fetchFavoutieList();
  }
  @override
  Widget build(BuildContext context) {
    FavouriteProvider _favProvider = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
            backgroundColor:Colors.white,
            elevation: 0,
            title: Row(
              children: [
                Icon(Icons.favorite,color: Colors.purple,),
                SizedBox(width: 30,),
                Text("Favourites",style: TextStyle(color:Colors.black ),),
              ],
            )
        ),
        body: (_favProvider.isLoading==true)?
        Center(
          child: CircularProgressIndicator(),
        ):
        (_favProvider.isLoading == false && _favProvider.hasData == false)?
        Center(child:Text("add some items") ,):
        ListView.builder(
          itemCount: _favProvider.favouriteList.length,
          itemBuilder: (BuildContext context,int index) {
            final favItem=_favProvider.favouriteList[index];
            return Card(
              child: ListTile(
                  leading:Image.network(favItem['products']['image']),
                  title: Text('Title: ${favItem['products']['name']}'),
                  subtitle:Text('Description: ${favItem['products']['description']}')
              ),
            );

          },
        )
    );
  }
}