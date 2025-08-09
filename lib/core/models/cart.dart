import 'package:ecomerce/core/models/product.dart';

class CartItem {
  final Product product;
  int quantity;
  String size;

  CartItem({required this.product, this.quantity = 1, required this.size});
}
