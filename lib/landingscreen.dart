import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_test/constants/color.dart';
import 'package:home_test/homescreen.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kPrimary,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: const AlignmentDirectional(-0.89, -0.9),
              child: Text('Neo', style: Theme.of(context).textTheme.headline1),
            ),
            Align(
              alignment: const AlignmentDirectional(-0.56, -0.9),
              child:
                  Text('Decor', style: Theme.of(context).textTheme.headline1),
            ),
            Align(
              alignment: const AlignmentDirectional(-0.86, -0.50),
              child: Text(
                'Let\'s',
                style: GoogleFonts.nunito(
                    fontSize: 45, fontWeight: FontWeight.bold, height: 1),
              ),
            ),
            Positioned(
              right: 150,
              top: 200,
              child: ClipOval(
                child: Container(
                  width: 400,
                  height: 410,
                  decoration: const BoxDecoration(color: kOrange),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-0.89, -0.36),
              child:
                  Text('decor', style: Theme.of(context).textTheme.headline1!),
            ),
            Align(
              alignment: const AlignmentDirectional(-0.78, -0.20),
              child: Text(
                'your home',
                style: GoogleFonts.nunito(
                    fontSize: 45, fontWeight: FontWeight.bold, height: 1),
              ),
            ),
            const Align(
              alignment: AlignmentDirectional(-0.77, 0.03),
              child: Text(
                'Be faithful to your own taste, because \nnothing you really like is ever out of style',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                ),
              ),
            ),
            Align(
                alignment: const AlignmentDirectional(-0.89, 0.20),
                child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 50,
                      color: Colors.black,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, '/bottommenu'))),
          ],
        ),
      ),
    );
  }
}
