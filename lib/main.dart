import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_test/constants/color.dart';
import 'package:home_test/constants/route.dart';
import 'package:home_test/helpers/providers.dart';
import 'package:home_test/landingscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        routes: route,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Nunito',
          primarySwatch: Colors.orange,
          textTheme: TextTheme(
            headline1: GoogleFonts.nunito(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                height: 1,
                color: kBlack),
          ),
        ),
        home: const HomePageWidget(),
      ),
    );
  }
}
