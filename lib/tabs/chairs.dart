import 'package:flutter/material.dart';
import 'package:home_test/constants/color.dart';
import 'package:home_test/helpers/product_providers.dart';
import 'package:home_test/product_screen.dart';
import 'package:provider/provider.dart';

import '../models/items.dart';

class Chairs extends StatefulWidget {
  const Chairs({Key? key}) : super(key: key);

  @override
  _ChairsState createState() => _ChairsState();
}

class _ChairsState extends State<Chairs> {
  @override
  Widget build(BuildContext context) {
    ProductProvider _productNotifier =
        Provider.of<ProductProvider>(context, listen: false);
    addToFavourite(index) => setState(() {
          chairs[index].like = !chairs[index].like!;
          if (chairs[index].like! == false) {
            _productNotifier.favourte
                .removeWhere((element) => element.id == chairs[index].id);
          } else {
            _productNotifier.addToFavourite(chairs[index]);
          }
        });

    return ListView.builder(
      itemCount: chairs.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductScreen(
                          item: chairs,
                          index: index,
                        ))),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(chairs[index].image!)),
                Positioned(
                    bottom: 30.0,
                    left: 10,
                    child: Text(chairs[index].brand!,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kWhite))),
                Positioned(
                  bottom: 10.0,
                  right: 0,
                  child: IconButton(
                      onPressed: () => addToFavourite(index),
                      icon: chairs[index].like! == true
                          ? const Icon(Icons.favorite,
                              color: Colors.red, size: 30)
                          : const Icon(Icons.favorite_outline,
                              color: kWhite, size: 30)),
                ),
                Positioned(
                    bottom: 10.0,
                    left: 10,
                    child: Text(chairs[index].name!,
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
