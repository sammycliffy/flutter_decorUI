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
  final List<Items>? item;
  final int? index;
  const ProductScreen({Key? key, @required this.item, this.index})
      : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ScrollController _controller = ScrollController();
  late final AnimationController _animationController, _controller1;

  late final Animation<Offset> _firstAnimation,
      _secondAnimation,
      _thirdAnimation,
      _fourthAnimation;
  ProductProvider? _productNotifier;
  double dotPosition = 0;
  int colorIndex = 0;

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
              padding: const EdgeInsets.only(left: 20),
              height: 250,
              child: NotificationListener(
                child: ListView.builder(
                  itemCount: widget.item!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(widget.item![index].image!)),
                    );
                  },
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
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
                    widget.item![widget.index!].brand!,
                    style: GoogleFonts.nunito(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                  Text(
                    widget.item![widget.index!].name!,
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
                    GestureDetector(
                      child:
                          circle(firstCircle, colorIndex == 0 ? true : false),
                      onTap: () => changeColorIndex(0),
                    ),
                    widthSpace(8),
                    GestureDetector(
                      child:
                          circle(secondCircle, colorIndex == 1 ? true : false),
                      onTap: () => changeColorIndex(1),
                    ),
                    widthSpace(8),
                    GestureDetector(
                      child:
                          circle(thirdCircle, colorIndex == 2 ? true : false),
                      onTap: () => changeColorIndex(2),
                    )
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
                      child: widget.item![widget.index!].like!
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
                        widget.item![widget.index!].quantity =
                            _productNotifier!.currentQuantity;
                        _productNotifier!
                            .addToCart(widget.item![widget.index!]);
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

  changeColorIndex(index) => setState(() {
        colorIndex = index;
      });
  addToFavourite(index) => setState(() {
        widget.item![widget.index!].like = !widget.item![widget.index!].like!;
        if (widget.item![widget.index!].like! == false) {
          _productNotifier!.favourte.removeWhere(
              (element) => element.id == widget.item![widget.index!].id);
        } else {
          _productNotifier!.addToFavourite(widget.item![widget.index!]);
        }
      });
}

circle(Color color, bool shadow) => Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          shadow
              ? BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                )
              : BoxShadow()
        ],
      ),
    );
