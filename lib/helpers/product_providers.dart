import 'package:flutter/material.dart';

import '../models/items.dart';

class ProductProvider with ChangeNotifier {
  final List<Items> _cart = [];
  final List<Items> _favourite = [];
  int _currentQuantity = 0;
  List<Items> get cart => _cart;
  List<Items> get favourte => _favourite;
  int get currentQuantity => _currentQuantity;

  void addToCart(Items item) {
    _cart.add(item);
  }

  void addToFavourite(Items item) {
    _favourite.add(item);
  }

  void setQuantity(int quantity) {
    _currentQuantity = quantity;
  }
  // void removeFromCart(index){
  //   _cart.removeWhere((item) => item.index == index)
  // }
}
