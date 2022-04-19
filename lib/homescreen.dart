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

class _HomeScreenState extends State<HomeScreen> {
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
                  Text(
                    'Discover\nNew items',
                    style: GoogleFonts.nunito(
                        fontSize: 35, fontWeight: FontWeight.bold, height: 1),
                  ),
                  heightSpace(30),
                  Row(children: [
                    const SearchBar(),
                    widthSpace(10),
                    const Filter()
                  ]),
                  heightSpace(20),
                  TabBar(
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
                  heightSpace(30),
                  const SizedBox(
                    height: 350,
                    child: TabBarView(
                      children: [
                        Trending(),
                        Decor(),
                        Chairs(),
                      ],
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
