import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
      ),
    );
  }
}
