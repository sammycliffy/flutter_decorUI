import 'package:flutter/material.dart';
import 'package:home_test/constants/color.dart';

class Filter extends StatelessWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 53,
      decoration:
          BoxDecoration(color: kBlack, borderRadius: BorderRadius.circular(5)),
      child: const Center(
          child: Icon(
        Icons.filter_alt_outlined,
        size: 30,
        color: kWhite,
      )),
    );
  }
}
