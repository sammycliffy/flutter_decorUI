import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_test/constants/color.dart';
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
    const Center(
      child: Text('2'),
    ),
    const Center(
      child: Text('3'),
    )
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
                children: const [
                  IconButton(
                    onPressed: null,
                    icon: FaIcon(
                      FontAwesomeIcons.house,
                      color: kWhite,
                    ),
                  ),
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.heart_broken_outlined,
                        color: kWhite,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: kWhite,
                        size: 30,
                      ))
                ]),
          ),
        ));
  }
}
