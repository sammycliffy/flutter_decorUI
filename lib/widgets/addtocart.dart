import 'package:flutter/material.dart';
import 'package:home_test/constants/color.dart';

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({Key? key}) : super(key: key);

  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
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
          child: const Icon(
            Icons.add_shopping_cart_outlined,
            color: kWhite,
          ),
        )
      ]),
    );
  }
}
