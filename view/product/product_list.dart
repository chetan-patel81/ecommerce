import 'package:ecommerce_app/view/product/product_card.dart';
import 'package:flutter/material.dart';


import '../../models/product_list.dart';
import '../../models/product_model.dart';
import '../../utils/color_utils.dart';
import '../../utils/style_utils.dart';

import '../cart/cart_page.dart';

// Define My cartItems globally
List<Product> cartItems = [];

class ProductList extends StatelessWidget {
  ProductList({super.key});

  List nameList = ["Crazy Deals", "Budget Buys", "Best Offer", "Fashion"];
  final double itemSpacing = 4.0;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_shopping_cart_sharp),
          ),
        ],
        title: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search Products",
                icon: Icon(Icons.search)),
          ),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                nameList.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.whiteColor,
                      border: Border.all(
                        color: AppColors.darkColor,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 14),
                      child: Text(nameList[index]),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  childAspectRatio: 0.5),
              itemCount: productList.length, // Your item count,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: productList[index],
                  onTap: () => _addToCart(productList[index],context),
                ); // Replace with your actual grid item widget
              },
            ),
          )
        ],
      ),
    );
  }

void _addToCart(product,context) {
  // Add the selected product to the cartItems list or perform other logic
  cartItems.add(product);
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => Cart(cartItems: cartItems)));
}
}
