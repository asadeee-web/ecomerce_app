import 'package:ecomerce/core/models/cart.dart';
import 'package:ecomerce/core/models/product.dart';
import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  List<CartItem> cartItems = [
    CartItem(
      product: Product(
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
      size: "L",
    ),
  ];

  double get subtotal {
    return cartItems.fold(
      0.0,
      (sum, item) => sum + item.product.price * item.quantity,
    );
  }

  double get shippingFee => subtotal > 0 ? 80.00 : 0.00;
  double get vat => 0.0;
  double get total => subtotal + vat + shippingFee;

  void removeItem(CartItem item) {
    cartItems.remove(item);
    notifyListeners();
  }

  void updateQuantity(CartItem item, int newQuantity) {
    if (newQuantity <= 0) {
      removeItem(item);
    } else {
      final index = cartItems.indexOf(item);
      if (index != -1) {
        cartItems[index] = CartItem(
          product: item.product,
          size: item.size,
          quantity: newQuantity,
        );
      }
    }
    notifyListeners();
  }
}
