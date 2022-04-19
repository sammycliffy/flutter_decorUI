import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_test/constants/color.dart';
import 'package:home_test/constants/spaces.dart';
import 'package:home_test/helpers/product_providers.dart';
import 'package:home_test/widgets/filter.dart';
import 'package:home_test/widgets/search.dart';
import 'package:provider/provider.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    ProductProvider _productNotifier =
        Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: homecolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Favourites',
              style: GoogleFonts.nunito(
                  fontSize: 30, fontWeight: FontWeight.bold, height: 1),
            ),
            heightSpace(30),
            Row(children: [const SearchBar(), widthSpace(10), const Filter()]),
            heightSpace(20),
            Expanded(
              child: ListView.builder(
                  itemCount: _productNotifier.favourte.length,
                  itemBuilder: (context, index) {
                    return fields(
                        image: _productNotifier.favourte[index].image,
                        names: _productNotifier.favourte[index].brand,
                        product: _productNotifier.favourte[index].name);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

fields({
  image,
  names,
  product,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          height: 70,
          decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: Colors.grey[300]!)),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  image,
                  width: 400,
                  height: 400,
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(names,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    heightSpace(8),
                    Text(product, style: const TextStyle(fontSize: 13))
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    GestureDetector(
                        child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
                    // hSize8,
                  ],
                ),
              )
            ],
          ),
        ),
        onTap: () {}),
  );
}
