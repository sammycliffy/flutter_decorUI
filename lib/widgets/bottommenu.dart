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

class _BottomMenuState extends State<BottomMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<Offset> _firstAnimation;
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    const HomeScreen(),
    const Favourite(),
    const Cart()
  ];
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _firstAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.8, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    ));

    repeatOnce();
  }

  void repeatOnce() async {
    await _controller.forward();
    await _controller.reverse();
  }

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
            child: SlideTransition(
              position: _firstAnimation,
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
          ),
        ));
  }

  setPage(index) => setState(() {
        _currentIndex = index;
      });
}
