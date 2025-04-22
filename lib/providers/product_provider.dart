import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import '../models/product_item.dart';

class ProductProvider with ChangeNotifier {
  List<ProductItem> _products = [];
  String? _error;

  List<ProductItem> get products => [..._products];
  String? get error => _error;

  Future<void> loadProductsFromJson() async {
    try {
      final String response = await rootBundle.loadString('assets/data/products.json');
      final Map<String, dynamic> jsonData = json.decode(response);

      List<ProductItem> loaded = [];

      jsonData.forEach((category, items) {
        if (items is List) {
          for (var item in items) {
            loaded.add(ProductItem.fromJson(item, category));
          }
        }
      });

      _products = loaded;
      _error = null;
    } catch (e) {
      _error = 'Failed to load products: $e';
    }
    notifyListeners();
  }

  List<ProductItem> getByCategory(String category) {
    return _products.where((item) => item.category == category).toList();
  }
}
