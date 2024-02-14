
import 'package:ecommerce_app/view/home/home_page/category_list.dart';
import 'package:ecommerce_app/view/product/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../cart/cart_page.dart';
import 'home_page/homepage.dart';

class BottomNavBar extends StatefulWidget {
  late  int currentIndex =0;

  BottomNavBar();

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}


class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _children = [
    HomePage(),
    ProductList(),
    Cart(cartItems: [],),
    CategoryList(categoryName: ""),
  ];

  void onTapTapped(int index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: _children[widget.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapTapped,
        currentIndex: widget.currentIndex,
        elevation: 4.0,
        selectedItemColor: AppColors.darkColor,
        unselectedItemColor: AppColors.secondaryColor,
        backgroundColor: AppColors.whiteColor,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inbox_outlined),
            label: "Child" ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
        ],
      ),
    );
  }
}