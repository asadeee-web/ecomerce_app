// import 'package:ecomerce/core/models/cart.dart';
// import 'package:ecomerce/core/models/product.dart';
// import 'package:ecomerce/ui/cart/cart_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';


// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0; // Index for the selected bottom nav item
//   final PageController _pageController = PageController();

  
  

//   // Mock cart data for initial display
//   List<CartItem> cartItems = [];

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // Add some initial items to the cart for demonstration
//   //   cartItems.add(CartItem(product: products[0], quantity: 2, size: 'L'));
//   //   cartItems.add(CartItem(product: products[1], quantity: 1, size: 'M'));
//   //   cartItems.add(CartItem(product: products[2], quantity: 1, size: 'L'));
//   // }

  

//   void _addToCart(Product product, String size) {
//     setState(() {
//       // Check if the item with the same product and size is already in the cart
//       final existingItem = cartItems.firstWhere(
//         (item) => item.product.name == product.name && item.size == size,
//         orElse: () => CartItem(product: product, size: size, quantity: 0),
//       );

//       if (existingItem.quantity > 0) {
//         existingItem.quantity++;
//       } else {
//         cartItems.add(CartItem(product: product, quantity: 1, size: size));
//       }
//     });
//   }

//   // A helper function to build the category buttons
//   Widget _buildCategoryButton({
//     required String text,
//     required bool isActive,
//     required VoidCallback onTap,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 8.0),
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(12),
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//           decoration: BoxDecoration(
//             color: isActive ? Colors.black : Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(
//               color: isActive ? Colors.black : Colors.grey.shade300,
//               width: 1,
//             ),
//           ),
//           child: Center(
//             child: Text(
//               text,
//               style: TextStyle(
//                 color: isActive ? Colors.white : Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // A helper function to build a product card
//   Widget _buildProductCard(BuildContext context, Product product) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProductDetailScreen(
//               product: product,
//               onAddToCart: (p, s) => _addToCart(p, s),
//             ),
//           ),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.1),
//               spreadRadius: 1,
//               blurRadius: 5,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Image.network(
//                       product.imageUrl,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: double.infinity,
//                     ),
//                   ),
//                   Positioned(
//                     top: 8,
//                     right: 8,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.8),
//                         shape: BoxShape.circle,
//                       ),
//                       padding: const EdgeInsets.all(4),
//                       child: const Icon(
//                         Icons.favorite_border,
//                         color: Colors.black,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     product.name,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                       color: Colors.black,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 4),
//                   Row(
//                     children: [
//                       Flexible(
//                         child: Text(
//                           '\$${product.price.toStringAsFixed(2)}',
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       if (product.oldPrice != null) ...[
//                         const SizedBox(width: 8),
//                         Flexible(
//                           child: Text(
//                             '\$${product.oldPrice!.toStringAsFixed(2)}',
//                             style: const TextStyle(
//                               decoration: TextDecoration.lineThrough,
//                               color: Colors.grey,
//                               fontSize: 12,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         Flexible(
//                           child: Text(
//                             '-${((1 - (product.price / product.oldPrice!)) * 100).toStringAsFixed(0)}%',
//                             style: const TextStyle(
//                               color: Colors.red,
//                               fontSize: 12,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

  
// }

// // Separate widget for the main Discover content
// class DiscoverScreenContent extends StatefulWidget {
//   final List<Product> products;
//   final Function({
//     required String text,
//     required bool isActive,
//     required VoidCallback onTap,
//   })
//   buildCategoryButton;
//   final Widget Function(Product product) buildProductCard;

//   const DiscoverScreenContent({
//     super.key,
//     required this.products,
//     required this.buildCategoryButton,
//     required this.buildProductCard,
//   });

//   @override
//   State<DiscoverScreenContent> createState() => _DiscoverScreenContentState();
// }

// class _DiscoverScreenContentState extends State<DiscoverScreenContent> {
//   String _selectedCategory = 'All';

//   final List<String> categories = [
//     'All',
//     'Tshirts',
//     'Jeans',
//     'Shoes',
//     'Jackets',
//     'Shorts',
//   ];

//   List<Product> _filterProducts() {
//     if (_selectedCategory == 'All') {
//       return widget.products;
//     }
//     return widget.products
//         .where((product) => product.category == _selectedCategory)
//         .toList();
//   }

//   void _onCategoryTap(String category) {
//     setState(() {
//       _selectedCategory = category;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final filteredProducts = _filterProducts();

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           'Discover',
//           style: TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 16.0),
//             child: Icon(
//               Icons.notifications_none,
//               color: Colors.black,
//               size: 28,
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade200,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: const Row(
//                         children: [
//                           Icon(Icons.search, color: Colors.grey),
//                           SizedBox(width: 8),
//                           Expanded(
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 hintText: 'Search for clothes...',
//                                 border: InputBorder.none,
//                                 hintStyle: TextStyle(color: Colors.grey),
//                               ),
//                             ),
//                           ),
//                           Icon(Icons.mic, color: Colors.grey),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Container(
//                     width: 50,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: const Icon(
//                       Icons.filter_list_rounded,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               SizedBox(
//                 height: 40,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: categories.length,
//                   itemBuilder: (context, index) {
//                     final category = categories[index];
//                     return widget.buildCategoryButton(
//                       text: category,
//                       isActive: _selectedCategory == category,
//                       onTap: () => _onCategoryTap(category),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 24),
//               filteredProducts.isEmpty
//                   ? const Center(
//                       child: Padding(
//                         padding: EdgeInsets.all(24.0),
//                         child: Text(
//                           'No products found in this category.',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     )
//                   : GridView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: filteredProducts.length,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             crossAxisSpacing: 16.0,
//                             mainAxisSpacing: 16.0,
//                             childAspectRatio: 0.65,
//                           ),
//                       itemBuilder: (context, index) {
//                         return widget.buildProductCard(filteredProducts[index]);
//                       },
//                     ),
//               const SizedBox(height: 24),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // The new Cart Screen widget
// class CartScreen extends StatefulWidget {
//   final List<CartItem> cartItems;
//   final Function(CartItem item) onItemRemoved;
//   final Function(CartItem item, int newQuantity) onQuantityChanged;

//   const CartScreen({
//     super.key,
//     required this.cartItems,
//     required this.onItemRemoved,
//     required this.onQuantityChanged,
//   });

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   double get _subtotal {
//     return widget.cartItems.fold(
//       0.0,
//       (sum, item) => sum + item.product.price * item.quantity,
//     );
//   }

//   double get _shippingFee => _subtotal > 0 ? 80.00 : 0.00;
//   double get _vat => 0.0;
//   double get _total => _subtotal + _vat + _shippingFee;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             // Since this screen is part of a PageView, we don't 'pop' it.
//             // A back button here would likely navigate to the previous screen in the stack
//             // if this screen was pushed onto it. For this implementation, the bottom nav
//             // handles navigation, so this is just a visual element.
//           },
//         ),
//         title: const Text(
//           'My Cart',
//           style: TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 16.0),
//             child: Icon(
//               Icons.notifications_none,
//               color: Colors.black,
//               size: 28,
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             children: [
//               const SizedBox(height: 16),
//               // List of Cart Items
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: widget.cartItems.length,
//                 itemBuilder: (context, index) {
//                   final item = widget.cartItems[index];
//                   return _buildCartItemCard(item);
//                 },
//               ),
//               const SizedBox(height: 24),
//               // Cart Summary
//               if (widget.cartItems.isNotEmpty) _buildSummarySection(),
//               const SizedBox(height: 24),
//               // Checkout Button
//               if (widget.cartItems.isNotEmpty) _buildCheckoutButton(),
//               const SizedBox(height: 24),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCartItemCard(CartItem item) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16.0),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.network(
//               item.product.imageUrl,
//               fit: BoxFit.cover,
//               width: 80,
//               height: 100,
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   item.product.name,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   'Size ${item.size}',
//                   style: const TextStyle(color: Colors.grey),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   '\$${item.product.price.toStringAsFixed(2)}',
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             children: [
//               IconButton(
//                 onPressed: () => widget.onItemRemoved(item),
//                 icon: const Icon(Icons.delete_outline, color: Colors.red),
//               ),
//               Row(
//                 children: [
//                   IconButton(
//                     onPressed: () =>
//                         widget.onQuantityChanged(item, item.quantity - 1),
//                     icon: const Icon(Icons.remove_circle_outline),
//                     splashRadius: 20,
//                   ),
//                   Text(
//                     '${item.quantity}',
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () =>
//                         widget.onQuantityChanged(item, item.quantity + 1),
//                     icon: const Icon(Icons.add_circle_outline),
//                     splashRadius: 20,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSummaryRow(String title, double value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(title, style: const TextStyle(fontSize: 16, color: Colors.grey)),
//           Text(
//             '\$${value.toStringAsFixed(2)}',
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSummarySection() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           _buildSummaryRow('Sub-total', _subtotal),
//           _buildSummaryRow('VAT (%)', _vat),
//           _buildSummaryRow('Shipping fee', _shippingFee),
//           const Divider(height: 24, thickness: 1, color: Colors.grey),
//           _buildSummaryRow('Total', _total),
//         ],
//       ),
//     );
//   }

//   Widget _buildCheckoutButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.black,
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//         onPressed: () {
//           // TODO: Implement checkout logic
//         },
//         child: const Text(
//           'Go To Checkout',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

// // A new widget for the product detail screen
// class ProductDetailScreen extends StatefulWidget {
//   final Product product;
//   final Function(Product, String) onAddToCart;

//   const ProductDetailScreen({
//     super.key,
//     required this.product,
//     required this.onAddToCart,
//   });

//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   late String _selectedSize;

//   @override
//   void initState() {
//     super.initState();
//     _selectedSize = widget.product.availableSizes.first;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: const BackButton(color: Colors.black),
//         title: const Text(
//           'Details',
//           style: TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 16.0),
//             child: Icon(
//               Icons.notifications_none,
//               color: Colors.black,
//               size: 28,
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Image and Favorite Button
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.vertical(
//                     bottom: Radius.circular(20),
//                   ),
//                   child: Image.network(
//                     widget.product.imageUrl,
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                     height: 400,
//                   ),
//                 ),
//                 Positioned(
//                   top: 24,
//                   right: 24,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.8),
//                       shape: BoxShape.circle,
//                     ),
//                     padding: const EdgeInsets.all(8),
//                     child: const Icon(
//                       Icons.favorite_border,
//                       color: Colors.black,
//                       size: 28,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Product Name
//                   Text(
//                     widget.product.name,
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   // Rating and Reviews
//                   Row(
//                     children: [
//                       const Icon(Icons.star, color: Colors.amber, size: 18),
//                       const SizedBox(width: 4),
//                       Text(
//                         '${widget.product.rating.toStringAsFixed(1)}/5 (${widget.product.reviews} reviews)',
//                         style: const TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   // Product Description
//                   Text(
//                     widget.product.description,
//                     style: const TextStyle(fontSize: 16, color: Colors.grey),
//                   ),
//                   const SizedBox(height: 24),
//                   // Choose Size section
//                   const Text(
//                     'Choose size',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 12),
//                   SizedBox(
//                     height: 45,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: widget.product.availableSizes.length,
//                       itemBuilder: (context, index) {
//                         final size = widget.product.availableSizes[index];
//                         final isSelected = size == _selectedSize;
//                         return InkWell(
//                           onTap: () {
//                             setState(() {
//                               _selectedSize = size;
//                             });
//                           },
//                           child: Container(
//                             width: 45,
//                             margin: const EdgeInsets.only(right: 12),
//                             decoration: BoxDecoration(
//                               color: isSelected ? Colors.black : Colors.white,
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(
//                                 color: isSelected ? Colors.black : Colors.grey,
//                                 width: 1,
//                               ),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 size,
//                                 style: TextStyle(
//                                   color: isSelected
//                                       ? Colors.white
//                                       : Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 32),
//                   // Price and Add to Cart Button
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Price',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               '\$${widget.product.price.toStringAsFixed(2)}',
//                               style: const TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.black,
//                             padding: const EdgeInsets.symmetric(vertical: 16),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           onPressed: () {
//                             widget.onAddToCart(widget.product, _selectedSize);
//                             // Optionally show a confirmation and pop the screen
//                             Navigator.pop(context);
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('Item added to cart!'),
//                                 duration: Duration(seconds: 1),
//                               ),
//                             );
//                           },
//                           child: const Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.shopping_cart_outlined,
//                                 color: Colors.white,
//                               ),
//                               SizedBox(width: 8),
//                               Text(
//                                 'Add to Cart',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
