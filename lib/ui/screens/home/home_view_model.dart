import 'package:flutter/material.dart';
import 'package:ecomerce/core/models/product.dart';

class HomeViewModel extends ChangeNotifier {
  String _selectedCategory = 'All';

  final List<String> categories = [
    'All',
    'Tshirts',
    'Jeans',
    'Shoes',
    'Jackets',
    'Shorts',
  ];

  final List<Product> products = [
    Product(
      name: 'Regular Fit Slogan',
      price: 1190.00,
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1718913936342-eaafff98834b?q=80&w=2072&auto=format&fit=crop',
      category: 'Tshirts',
      rating: 4.0,
      reviews: 45,
      description:
          'The name says it all, the right size slightly snugs the body...',
      availableSizes: ['S', 'M', 'L', 'XL'],
    ),
    // ... other products
  ];

  String get selectedCategory => _selectedCategory;

  List<Product> get filteredProducts {
    if (_selectedCategory == 'All') return products;
    return products.where((p) => p.category == _selectedCategory).toList();
  }

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
