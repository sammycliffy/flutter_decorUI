import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_test/constants/color.dart';
import 'package:home_test/constants/spaces.dart';
import 'package:animations/animations.dart';
import 'package:home_test/homescreen.dart';
import 'package:home_test/widgets/bottommenu.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late final scaffoldKey = GlobalKey<ScaffoldState>();
  late final AnimationController _controller;
  late final AnimationController _controller1;
  late final AnimationController _controller2;
  late final AnimationController _controller3;
  late final AnimationController _controller4;
  late final Animation<Offset>? _offsetAnimation;
  late final Animation<Offset>? _offsetAnimation1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _controller1 = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.4, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
    ));
    _offsetAnimation1 = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.4, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller1,
      curve: Curves.elasticIn,
    ));

    repeatOnce();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    super.dispose();
  }

  void repeatOnce() async {
    await _controller.forward();
    await _controller.reverse();
    await _controller1.forward();
    await _controller1.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kPrimary,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 20,
              child: SlideTransition(
                position: _offsetAnimation!,
                child: Row(
                  children: [
                    Text('Neo', style: Theme.of(context).textTheme.headline1),
                    Text('Decor',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: kOrange)),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 90,
              top: 250,
              child: SlideTransition(
                position: _offsetAnimation!,
                child: ClipOval(
                  child: Container(
                    width: 400,
                    height: 410,
                    decoration: const BoxDecoration(color: klandingCircle),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 200,
              child: SlideTransition(
                position: _offsetAnimation!,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Let\'s ',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 50)),
                    heightSpace(10),
                    Text('decor ',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 50, fontStyle: FontStyle.italic)),
                    heightSpace(10),
                    Text('your home',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 50,
                            ))
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 410,
              child: SlideTransition(
                position: _offsetAnimation!,
                child: const Text(
                  'Be faithful to your own taste, because \nnothing you really like is ever out of style',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Positioned(
                left: 20,
                top: 480,
                child: SlideTransition(
                  position: _offsetAnimation!,
                  child: IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.arrowRightLong,
                        size: 30,
                      ),
                      onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return const BottomMenu();
                              },
                            ),
                          )),
                )),
          ],
        ),
      ),
    );
  }
}
