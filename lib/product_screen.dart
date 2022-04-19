import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_test/constants/color.dart';
import 'package:home_test/constants/spaces.dart';
import 'package:home_test/helpers/product_providers.dart';
import 'package:home_test/widgets/addtocart.dart';
import 'package:home_test/widgets/counter.dart';
import 'package:home_test/widgets/toast.dart';
import 'package:provider/provider.dart';

import 'models/items.dart';

class ProductScreen extends StatefulWidget {
  final Items? item;
  final int? index;
  const ProductScreen({Key? key, @required this.item, this.index})
      : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ScrollController _controller = ScrollController();
  ProductProvider? _productNotifier;
  double dotPosition = 0;

  @override
  Widget build(BuildContext context) {
    _productNotifier = Provider.of<ProductProvider>(context, listen: false);
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 250,
              child: NotificationListener(
                child: ListView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:
                              Image.asset('assets/images/candle_holder.jpeg')),
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
                onNotification: (value) {
                  if (value is ScrollEndNotification) {
                    if (_controller.position.pixels >= 0.0 &&
                        _controller.position.pixels < 100) {
                      setState(() {
                        dotPosition = 0.0;
                      });
                    } else if (_controller.position.pixels >= 100 &&
                        _controller.position.pixels < 150) {
                      setState(() {
                        dotPosition = 1.0;
                      });
                    } else if (_controller.position.pixels >= 150) {
                      setState(() {
                        dotPosition = 2.0;
                      });
                    }
                    print(_controller.position.pixels);
                    return true;
                  }
                  return false;
                },
              ),
            ),
            heightSpace(20),
            Center(
              child: DotsIndicator(
                dotsCount: 3,
                position: dotPosition,
                decorator: const DotsDecorator(
                  color: kWhite, // Inactive color
                  activeColor: Colors.red,
                ),
              ),
            ),
            heightSpace(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    widget.item!.brand!,
                    style: GoogleFonts.nunito(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                  Text(
                    widget.item!.name!,
                    style: GoogleFonts.nunito(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                ]),
                const Text('\$50', style: TextStyle(fontSize: 30))
              ],
            ),
            heightSpace(20),
            const Text(
                'ORB is a set of seven metal candle holders stacked\non top of one another to form a modern spherical sculpture. Designed to be functional.'),
            heightSpace(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    circle(firstCircle),
                    widthSpace(5),
                    circle(secondCircle),
                    widthSpace(5),
                    circle(thirdCircle)
                  ],
                ),
                const Counter()
              ],
            ),
            heightSpace(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: kWhite, shape: BoxShape.circle),
                  child: Center(
                      child: widget.item!.like!
                          ? IconButton(
                              onPressed: () => addToFavourite(widget.index),
                              icon: const Icon(Icons.favorite),
                              color: Colors.red,
                            )
                          : IconButton(
                              onPressed: () => addToFavourite(widget.index),
                              icon: const Icon(Icons.favorite_outline),
                            )),
                ),
                GestureDetector(
                    onTap: () {
                      if (_productNotifier!.currentQuantity == 0) {
                        ToastUtils.showRedToast('Select quantity');
                      } else {
                        widget.item!.quantity =
                            _productNotifier!.currentQuantity;
                        _productNotifier!.addToCart(widget.item!);
                        ToastUtils.showRedToast('added to cart');
                      }
                    },
                    child: const AddToCartButton())
              ],
            )
          ],
        ),
      )),
    );
  }

  addToFavourite(index) => setState(() {
        widget.item!.like = !widget.item!.like!;
        if (widget.item!.like! == false) {
          _productNotifier!.favourte
              .removeWhere((element) => element.id == widget.item!.id);
        } else {
          _productNotifier!.addToFavourite(widget.item!);
        }
      });
}

circle(color) => Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
