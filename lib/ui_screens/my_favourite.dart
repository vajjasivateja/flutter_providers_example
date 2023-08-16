import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favourite_provider.dart';

class MyFavouriteItemScreen extends StatefulWidget {
  const MyFavouriteItemScreen({Key? key}) : super(key: key);

  @override
  State<MyFavouriteItemScreen> createState() => _MyFavouriteItemScreenState();
}

class _MyFavouriteItemScreenState extends State<MyFavouriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("My Favourites List"),
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Consumer<FavouriteItemProvider>(
                          builder: (context, value, child) {
                            return ListTile(
                                onTap: () {
                                  if (value.selectedItems.contains(index)) {
                                    value.removeItems(index);
                                  } else {
                                    value.addItems(index);
                                  }
                                },
                                title: Text("Item $index"),
                                trailing: Icon(value.selectedItems.contains(index) ? Icons.favorite : Icons.favorite_border_outlined));
                          },
                        );
                      },
                      itemCount: favouriteProvider.selectedItems.length,
                    ))
              ],
            ),
          ),
        ));
  }
}
