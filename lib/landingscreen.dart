import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_test/constants/color.dart';
import 'package:home_test/constants/spaces.dart';
import 'package:home_test/homescreen.dart';
import 'package:home_test/widgets/bottommenu.dart';
import 'package:flutter_ripple/flutter_ripple.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late final AnimationController _controller, _controller2;

  late final Animation<Offset> _firstAnimation,
      _secondAnimation,
      _thirdAnimation,
      _fourthAnimation;
  int radius = 900;
  bool tap = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _firstAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.4, 0.0),
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
          0.3,
          1.0,
          curve: Curves.elasticIn,
        )));

    _thirdAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.4, 0.0),
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.6,
          1.0,
          curve: Curves.elasticIn,
        )));
    _fourthAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.4, 0.0),
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          1.0,
          1.0,
          curve: Curves.elasticIn,
        )));
    _controller2 = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: const Duration(seconds: 1),
    );
    repeatOnce();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void repeatOnce() async {
    await _controller.forward();
    await _controller.reverse();
  }

  Widget _containerWidget(double radius) {
    return Container(
      width: radius,
      height: radius + 10,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: klandingCircle.withOpacity(1 - 0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kPrimary,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 50,
              left: 20,
              child: SlideTransition(
                position: _firstAnimation,
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
            AnimatedBuilder(
              animation: CurvedAnimation(
                  parent: _controller2, curve: Curves.easeInOutExpo),
              builder: (BuildContext context, Widget? child) {
                return Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ...List.generate(
                      2,
                      (int index) => Positioned(
                        right: 146,
                        top: 250,
                        child: SlideTransition(
                          position: _secondAnimation,
                          child: _containerWidget(
                              (radius * index) * _controller2.value),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              left: 20,
              top: 200,
              child: SlideTransition(
                position: _thirdAnimation,
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
                position: _secondAnimation,
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
                  position: _fourthAnimation,
                  child: IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.arrowRightLong,
                        size: 30,
                      ),
                      onPressed: () async {
                        await _controller2.forward();

                        Navigator.pushNamed(context, '/bottommenu');
                        _controller2.reverse();
                      }),
                )),
          ],
        ),
      ),
    );
  }
}
