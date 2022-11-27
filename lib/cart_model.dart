import 'package:flutter/material.dart';

import 'product_model.dart';

class CartModel extends ChangeNotifier {
  final List<Product> _lsProducts = [];

  addProduct(Product product) {
    _lsProducts.add(product);
    notifyListeners();
  }

  removeProduct(Product product) {
    _lsProducts.remove(product);
    notifyListeners();
  }

  getProduct() => _lsProducts;

  getCount() => _lsProducts.length;

  getTotal() {
    num sum = 0;
    for (var element in _lsProducts) {
      sum += element.price;
    }
    return sum.toStringAsFixed(2);
  }
}
