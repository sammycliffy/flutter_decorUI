import 'package:flutter/material.dart';
import 'package:home_test/constants/color.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
          color: kcounterColor, borderRadius: BorderRadius.circular(30)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10, left: 8),
          child: Text(
            '-',
            style: TextStyle(fontSize: 40),
          ),
        ),
        Text(
          counter.toString(),
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        button()
      ]),
    );
  }

  button() => GestureDetector(
        onTap: () => setState(() {
          counter++;
        }),
        child: Container(
          width: 40,
          height: 30,
          decoration:
              const BoxDecoration(color: kBlack, shape: BoxShape.circle),
          child: const Center(
              child: Text('+',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: kWhite))),
        ),
      );
}
