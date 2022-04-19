import 'package:flutter/material.dart';
import 'package:home_test/constants/color.dart';
import 'package:home_test/helpers/product_providers.dart';
import 'package:home_test/product_screen.dart';
import 'package:provider/provider.dart';

import '../models/items.dart';

class Decor extends StatefulWidget {
  const Decor({Key? key}) : super(key: key);

  @override
  _DecorState createState() => _DecorState();
}

class _DecorState extends State<Decor> {
  @override
  Widget build(BuildContext context) {
    ProductProvider _productNotifier =
        Provider.of<ProductProvider>(context, listen: false);
    addToFavourite(index) => setState(() {
          decor[index].like = !decor[index].like!;
          if (decor[index].like! == false) {
            _productNotifier.favourte
                .removeWhere((element) => element.id == decor[index].id);
          } else {
            _productNotifier.addToFavourite(decor[index]);
          }
        });

    return ListView.builder(
      itemCount: decor.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductScreen(item: decor[index]))),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(decor[index].image!)),
                Positioned(
                    bottom: 30.0,
                    left: 10,
                    child: Text(decor[index].brand!,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kWhite))),
                Positioned(
                  bottom: 10.0,
                  right: 0,
                  child: IconButton(
                      onPressed: () => addToFavourite(index),
                      icon: decor[index].like! == true
                          ? const Icon(Icons.favorite,
                              color: Colors.red, size: 30)
                          : const Icon(Icons.favorite_outline,
                              color: kWhite, size: 30)),
                ),
                Positioned(
                    bottom: 10.0,
                    left: 10,
                    child: Text(decor[index].name!,
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
