import 'package:flutter/material.dart';
import 'package:home_test/constants/color.dart';

class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
    List<Items> items = [
      Items(
          brand: 'Noom',
          name: 'Noom Vase',
          image: 'assets/images/candle_holder.jpeg'),
      Items(brand: 'Noom', name: 'Noom Vase', image: 'assets/images/gabo.jpg'),
      Items(brand: 'Noom', name: 'Noom Vase', image: 'assets/images/gabo2.jpg')
    ];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/productscreen'),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(items[index].image!)),
                Positioned(
                    bottom: 30.0,
                    left: 10,
                    child: Text(items[index].brand!,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kWhite))),
                const Positioned(
                  bottom: 10.0,
                  right: 0,
                  child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.heart_broken,
                        color: kWhite,
                      )),
                ),
                Positioned(
                    bottom: 10.0,
                    left: 10,
                    child: Text(items[index].name!,
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

class Items {
  String? brand;
  String? name;
  String? image;

  Items({this.brand, this.image, this.name});
}
