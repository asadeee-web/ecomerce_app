import 'package:ecomerce/core/models/product.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Product> products = [
    Product(
      name: 'Regular Fit Slogan',
      price: 1190.00,
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1718913936342-eaafff98834b?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      category: 'Tshirts',
      rating: 4.0,
      reviews: 45,
      description:
          'The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.',
      availableSizes: ['S', 'M', 'L', 'XL'],
    ),
    Product(
      name: 'Regular Fit Polo',
      price: 1100.00,
      oldPrice: 2300.00,
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1718913936342-eaafff98834b?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      category: 'Tshirts',
      rating: 4.5,
      reviews: 62,
      description:
          'A classic polo shirt with a modern twist. Perfect for a casual yet smart look.',
      availableSizes: ['S', 'M', 'L'],
    ),
    Product(
      name: 'Regular Fit Black',
      price: 1690.00,
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1718913936342-eaafff98834b?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      category: 'Tshirts',
      rating: 3.8,
      reviews: 21,
      description:
          'A simple, versatile black t-shirt. A must-have staple for any wardrobe.',
      availableSizes: ['S', 'M', 'L', 'XL'],
    ),
    Product(
      name: 'Regular Fit V-Neck',
      price: 1290.00,
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1718913936342-eaafff98834b?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      category: 'Tshirts',
      rating: 4.2,
      reviews: 35,
      description:
          'A comfortable V-neck t-shirt that is perfect for layering or wearing on its own.',
      availableSizes: ['S', 'M', 'L'],
    ),
    Product(
      name: 'Regular Fit T-Shirt',
      price: 999.00,
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1718913936342-eaafff98834b?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      category: 'Tshirts',
      rating: 4.7,
      reviews: 88,
      description:
          'A classic crew neck t-shirt with a soft feel. Great for everyday wear.',
      availableSizes: ['S', 'M', 'L', 'XL', 'XXL'],
    ),
    Product(
      name: 'Slim Fit Slogan',
      price: 1450.00,
      oldPrice: 1999.00,
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1718913936342-eaafff98834b?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      category: 'Shorts',
      rating: 4.1,
      reviews: 15,
      description:
          'Stylish slim fit shirt with a bold slogan. Makes a statement wherever you go.',
      availableSizes: ['M', 'L', 'XL'],
    ),
  ];
}
