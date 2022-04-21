import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_test/constants/color.dart';
import 'package:home_test/constants/spaces.dart';
import 'package:home_test/tabs/chairs.dart';
import 'package:home_test/tabs/decor.dart';
import 'package:home_test/tabs/trending.dart';
import 'package:home_test/widgets/filter.dart';
import 'package:home_test/widgets/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<Offset> _firstAnimation, _secondAnimation;

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
      curve: Curves.elasticIn,
    ));

    _secondAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.4, 0.0),
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.5,
          1.0,
          curve: Curves.elasticOut,
        )));

    repeatOnce();
  }

  void repeatOnce() async {
    await _controller.forward();
    await _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: homecolor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SlideTransition(
                    position: _firstAnimation,
                    child: Text(
                      'Discover\nNew items',
                      style: GoogleFonts.nunito(
                          fontSize: 35, fontWeight: FontWeight.bold, height: 1),
                    ),
                  ),
                  heightSpace(30),
                  SlideTransition(
                    position: _firstAnimation,
                    child: Row(children: [
                      const SearchBar(),
                      widthSpace(10),
                      const Filter()
                    ]),
                  ),
                  heightSpace(20),
                  SlideTransition(
                    position: _firstAnimation,
                    child: TabBar(
                      labelColor: kTabColor,
                      indicatorColor: kOrange,
                      unselectedLabelColor: Colors.grey[600],
                      indicatorWeight: 3.0,
                      indicatorPadding:
                          const EdgeInsets.symmetric(horizontal: 40.0),
                      labelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                      tabs: const [
                        Tab(
                          text: 'Trending',
                        ),
                        Tab(
                          text: 'Decor',
                        ),
                        Tab(
                          text: 'Chairs',
                        ),
                      ],
                    ),
                  ),
                  heightSpace(30),
                  SlideTransition(
                    position: _firstAnimation,
                    child: const SizedBox(
                      height: 350,
                      child: TabBarView(
                        children: [
                          Trending(),
                          Decor(),
                          Chairs(),
                        ],
                      ),
                    ),
                  ),
                  heightSpace(30),
                ],
              ),
            ),
          )),
    );
  }
}
