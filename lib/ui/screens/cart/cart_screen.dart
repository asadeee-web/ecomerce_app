import 'package:ecomerce/core/models/cart.dart';
import 'package:ecomerce/ui/screens/cart/cart_view_model.dart';
import 'package:ecomerce/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final cartViewModel = context.watch<CartViewModel>();

    return ChangeNotifierProvider(
      create: (_) => CartViewModel(),
      child: Consumer<CartViewModel>(
        builder: (context, cartViewModel, child) {
          return Scaffold(
            appBar: const CustomAppBar(title: 'Cart'),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    // List of Cart Items
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartViewModel.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartViewModel.cartItems[index];
                        return _buildCartItemCard(
                          item,
                          onItemRemoved: cartViewModel.removeItem,
                          onQuantityChanged: cartViewModel.updateQuantity,
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    // Cart Summary
                    if (cartViewModel.cartItems.isNotEmpty)
                      _buildSummarySection(cartViewModel),
                    const SizedBox(height: 24),
                    // Checkout Button
                    if (cartViewModel.cartItems.isNotEmpty)
                      _buildCheckoutButton(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCartItemCard(
    CartItem item, {
    required Function(CartItem) onItemRemoved,
    required Function(CartItem, int) onQuantityChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.product.imageUrl,
              fit: BoxFit.cover,
              width: 80,
              height: 100,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'Size ${item.size}',
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${item.product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () => onItemRemoved(item),
                icon: const Icon(Icons.delete_outline, color: Colors.red),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => onQuantityChanged(item, item.quantity - 1),
                    icon: const Icon(Icons.remove_circle_outline),
                    splashRadius: 20,
                  ),
                  Text(
                    '${item.quantity}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: () => onQuantityChanged(item, item.quantity + 1),
                    icon: const Icon(Icons.add_circle_outline),
                    splashRadius: 20,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, color: Colors.grey)),
          Text(
            '\$${value.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSummarySection(CartViewModel cartViewModel) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSummaryRow('Sub-total', cartViewModel.subtotal),
          _buildSummaryRow('VAT (%)', cartViewModel.vat),
          _buildSummaryRow('Shipping fee', cartViewModel.shippingFee),
          const Divider(height: 24, thickness: 1, color: Colors.grey),
          _buildSummaryRow('Total', cartViewModel.total),
        ],
      ),
    );
  }

  Widget _buildCheckoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          // TODO: Implement checkout logic
        },
        child: const Text(
          'Go To Checkout',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
