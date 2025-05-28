import 'package:flutter/material.dart';
import 'package:untitled4/model/product.dart';

class ProductNotifier extends ChangeNotifier {
  Product? product;

  Future<void> loadProduct() async {
    await Future.delayed(Duration(seconds: 2));
    product = generateProduct();
    notifyListeners();
  }
}
