import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_test/constants/color.dart';
import 'package:home_test/constants/spaces.dart';
import 'package:home_test/trending.dart';
import 'package:home_test/widgets/bottommenu.dart';

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
                        fontSize: 40, fontWeight: FontWeight.bold, height: 1),
                  ),
                  heightSpace(30),
                  searchBar(),
                  heightSpace(30),
                  const TabBar(
                    labelColor: kTabColor,
                    indicatorColor: kOrange,
                    unselectedLabelColor: kBlack,
                    tabs: [
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
                        Icon(Icons.directions_transit),
                        Icon(Icons.directions_bike),
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

  searchBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            hintText: 'Search product',
            prefixIcon: GestureDetector(
                onTap: null, child: const Icon(Icons.search, size: 30))),
      ),
    );
  }
}
