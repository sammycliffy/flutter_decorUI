import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_test/carts.dart';
import 'package:home_test/constants/color.dart';
import 'package:home_test/favourite.dart';
import 'package:home_test/homescreen.dart';

class BottomMenu extends StatefulWidget {
  final initialPage;

  const BottomMenu({Key? key, this.initialPage}) : super(key: key);

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    const HomeScreen(),
    const Favourite(),
    const Cart()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: homecolor,
        body: _tabs[_currentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 120,
            height: 70,
            decoration: BoxDecoration(
                color: kBlack, borderRadius: BorderRadius.circular(20)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () => setPage(0),
                      icon: Icon(
                        Icons.home_outlined,
                        color: _currentIndex == 0 ? kOrange : kWhite,
                        size: 30,
                      )),
                  IconButton(
                    onPressed: () => setPage(1),
                    icon: FaIcon(
                      FontAwesomeIcons.heart,
                      color: _currentIndex == 1 ? kOrange : kWhite,
                    ),
                  ),
                  IconButton(
                      onPressed: () => setPage(2),
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: _currentIndex == 2 ? kOrange : kWhite,
                        size: 30,
                      ))
                ]),
          ),
        ));
  }

  setPage(index) => setState(() {
        _currentIndex = index;
      });
}
