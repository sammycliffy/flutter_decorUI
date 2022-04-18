import 'package:flutter/material.dart';
import 'package:home_test/constants/color.dart';
import 'package:home_test/constants/spaces.dart';
import 'package:home_test/widgets/addtocart.dart';
import 'package:home_test/widgets/counter.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homecolor,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 50,
                height: 50,
                decoration:
                    const BoxDecoration(color: kWhite, shape: BoxShape.circle),
                child: Center(
                    child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context),
                ))),
            heightSpace(20),
            SizedBox(
              height: 250,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/images/candle_holder.jpeg')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:
                            Image.asset('assets/images/candle_holder1.jpeg')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:
                            Image.asset('assets/images/candle_holder2.jpeg')),
                  )
                ],
              ),
            ),
            heightSpace(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: const [
                  Text('Noom \nCandles', style: TextStyle(fontSize: 30))
                ]),
                const Text('\$50', style: TextStyle(fontSize: 30))
              ],
            ),
            heightSpace(20),
            const Text(
                'ORB is a set of seven metal candle holders stacked\non top of one another to form a modern spherical sculpture. Designed to be functional.'),
            heightSpace(30),
            Row(
              children: [Container(color: kWhite), const Counter()],
            ),
            heightSpace(30),
            const AddToCart()
          ],
        ),
      )),
    );
  }
}
