import 'package:flutter/material.dart';
import 'package:home_test/constants/color.dart';
import 'package:home_test/helpers/product_providers.dart';
import 'package:home_test/product_screen.dart';
import 'package:provider/provider.dart';

import '../models/items.dart';

class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
    ProductProvider _productNotifier =
        Provider.of<ProductProvider>(context, listen: false);
    addToFavourite(index) => setState(() {
          trending[index].like = !trending[index].like!;
          if (trending[index].like! == false) {
            _productNotifier.favourte
                .removeWhere((element) => element.id == trending[index].id);
          } else {
            _productNotifier.addToFavourite(trending[index]);
          }
        });

    return ListView.builder(
      itemCount: trending.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductScreen(
                          item: trending,
                          index: index,
                        ))),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(trending[index].image!)),
                Positioned(
                    bottom: 30.0,
                    left: 10,
                    child: Text(trending[index].brand!,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kWhite))),
                Positioned(
                  bottom: 10.0,
                  right: 0,
                  child: IconButton(
                      onPressed: () => addToFavourite(index),
                      icon: trending[index].like! == true
                          ? const Icon(Icons.favorite,
                              color: Colors.red, size: 30)
                          : const Icon(Icons.favorite_outline,
                              color: kWhite, size: 30)),
                ),
                Positioned(
                    bottom: 10.0,
                    left: 10,
                    child: Text(trending[index].name!,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: kWhite)))
              ],
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
