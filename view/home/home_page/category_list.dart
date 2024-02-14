import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/product_list.dart';
import '../../../models/product_model.dart';
import '../../cart/cart_page.dart';
import '../../product/product_card.dart';
import '../../product/product_list.dart';

class CategoryList extends StatelessWidget {
  CategoryList({Key? key, required this.categoryName}) : super(key: key);

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = productList
        .where((product) => product.category == categoryName)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.5,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: filteredProducts[index],
            onTap: () => _addToCart(filteredProducts[index], context),
          );
        },
      ),
    );
  }

  void _addToCart(product, context) {
    // Add the selected product to the cartItems list  logic
    cartItems.add(product);
    // You can navigate to the cart page or any other page as needed.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Cart(cartItems: cartItems)),
    );
  }
}