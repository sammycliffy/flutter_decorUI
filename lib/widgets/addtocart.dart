import 'package:flutter/material.dart';
import 'package:home_test/constants/color.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 220,
      decoration:
          BoxDecoration(color: kBlack, borderRadius: BorderRadius.circular(25)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const Text(
          'Add to cart',
          style: TextStyle(color: kWhite, fontSize: 18),
        ),
        Container(
          width: 50,
          height: 50,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.grey[600]),
          child: const Icon(Icons.shopping_cart_outlined),
        )
      ]),
    );
  }
}
