import 'package:ecomerce/core/constants/colors.dart';
import 'package:ecomerce/core/constants/textStyle.dart';
import 'package:ecomerce/core/models/product.dart';
import 'package:ecomerce/ui/screens/home/home_view_model.dart';
import 'package:ecomerce/ui/widgets/custom_appbar.dart';
import 'package:ecomerce/ui/widgets/custom_cateogory_button.dart';
import 'package:ecomerce/ui/widgets/custom_product_card.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: const CustomAppBar(title: 'Discover'),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // Search Bar + Filter Icon
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: const Row(
                              children: [
                                Icon(Icons.search, color: Colors.grey),
                                SizedBox(width: 8),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search for clothes...',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                Icon(Icons.mic, color: Colors.grey),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.filter_list_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Categories
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.categories.length,
                        itemBuilder: (context, index) {
                          final category = viewModel.categories[index];
                          return CategoryButton(
                            text: category,
                            isActive: viewModel.selectedCategory == category,
                            onTap: () => viewModel.selectCategory(category),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Products Grid
                    viewModel.filteredProducts.isEmpty
                        ? Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Text(
                              textAlign: TextAlign.center,
                              'No products found in this category.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: viewModel.filteredProducts.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                  childAspectRatio: 0.65,
                                ),
                            itemBuilder: (context, index) {
                              return ProductCard(
                                product: viewModel.filteredProducts[index],
                              );
                            },
                          ),

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
}
