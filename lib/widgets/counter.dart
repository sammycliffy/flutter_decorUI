import 'package:flutter/material.dart';
import 'package:home_test/constants/color.dart';
import 'package:home_test/helpers/product_providers.dart';
import 'package:home_test/widgets/toast.dart';
import 'package:provider/provider.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  ProductProvider? _productNotifier;
  @override
  Widget build(BuildContext context) {
    _productNotifier = Provider.of<ProductProvider>(context, listen: false);
    return Container(
      width: 110,
      height: 40,
      decoration: BoxDecoration(
          color: kcounterColor, borderRadius: BorderRadius.circular(30)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0, left: 10),
          child: GestureDetector(
            onTap: () => decrement(),
            child: Container(
              width: 16,
              height: 3,
              color: kBlack,
            ),
          ),
        ),
        Text(
          counter.toString(),
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        button()
      ]),
    );
  }

  decrement() {
    if (counter <= 0) {
      ToastUtils.showRedToast('Invalid value');
    } else {
      setState(() {
        counter--;
      });
    }
  }

  button() => GestureDetector(
        onTap: () {
          setState(() {
            counter++;
          });
          _productNotifier!.setQuantity(counter);
        },
        child: Container(
          width: 40,
          height: 30,
          decoration:
              const BoxDecoration(color: kBlack, shape: BoxShape.circle),
          child: const Center(
              child: Text('+',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: kWhite))),
        ),
      );
}
