import 'package:flutter/material.dart';
import 'package:flutter_providers_example/providers/favourite_provider.dart';
import 'package:flutter_providers_example/ui_screens/my_favourite.dart';
import 'package:provider/provider.dart';

class FavouritesListScreen extends StatefulWidget {
  const FavouritesListScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesListScreen> createState() => _FavouritesListScreenState();
}

class _FavouritesListScreenState extends State<FavouritesListScreen> {
  List<int> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Text("Favourites List"),
              actions: [
                InkWell(
                  child: Icon(Icons.favorite),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyFavouriteItemScreen()));
                  },
                ),
                SizedBox(
                  width: 20,
                )
              ],
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
                    itemCount: 100,
                  ))
                ],
              ),
            )));
  }
}
