/*
import 'package:flutter/material.dart';
import 'package:new_cart/utils/color_utils.dart';
import 'package:new_cart/utils/style_utils.dart';

import '../../utils/review_format.dart';
import '../product/product_list.dart';

class Cart extends StatefulWidget {
  Cart({Key? key, required this.cartItems}) : super(key: key);
  final List cartItems;

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
 // var quantity = 0;
  var totalPrice = 0;
  var totalP = 0.0;



  calculateTotalPrice(price,quantity) {
    totalPrice = (price * quantity).toInt(); // Convert price to int before multiplying
  }

  calculate() {

    totalP = 0;
    for (var item in widget.cartItems) {
      totalP += item.discPrice * item.quantity;
    }
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        // appBar: DefaultAppBar(title: "Cart", child: Text(''),),
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Subtotal : \$${totalP.toStringAsFixed(2)}",
                  style: MyAppStyle.titleStyle(AppColors.darkColor)),
              const Row(
                children: [
                  Icon(Icons.task_alt_rounded),
                  Text("Your order is eligible for free Delivery"),
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              Center(
                child: (cartItems.isNotEmpty)
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(
                                top: 8.0, left: 8.0, right: 8.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.accentColor)),
                            child: Row(
                              children: [
                                Image(
                                  image:
                                      AssetImage(cartItems[index].image),
                                  height: 110.0,
                                  width: 110.0,
                                  fit: BoxFit.cover,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(cartItems[index].name,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 16.0)),
                                        Text(
                                            cartItems[index].description,
                                            style: const TextStyle(
                                                fontSize: 12.0,
                                                color: AppColors.kLightColor)),
                                        Row(
                                          children: [
                                            Text(
                                              "\$${cartItems[index].discPrice}",
                                              style: MyAppStyle.priceStyle(
                                                  AppColors.darkColor, false),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "\$ ${cartItems[index].realPrice.toString()}",
                                              style: MyAppStyle.priceStyle(
                                                  AppColors.darkColor, true),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "(${reviewFormat(cartItems[index].reviews)}) Reviews",
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (widget.cartItems[index].quantity > 0) {
                                                      widget.cartItems[index].quantity--;
                                                      calculateTotalPrice(widget.cartItems[index].discPrice);
                                                      calculate();
                                                    }
                                                  });
                                                }
                                                ,
                                                icon: const Icon(
                                                  Icons.remove_circle,
                                                  color: AppColors.darkColor,
                                                )),
                                            Container(
                                                width: 44.0,
                                                height: 44.0,
                                                padding: const EdgeInsets.only(
                                                    top: 22.0),
                                                color: AppColors.primaryColor,
                                                child: TextField(
                                                  enabled: false,
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText:
                                                          quantity.toString(),
                                                      hintStyle:
                                                          const TextStyle(
                                                              color: AppColors
                                                                  .darkColor)),
                                                )),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (cartItems[index].quantity <=
                                                        widget.cartItems[index]
                                                            .quantity) {
                                                      cartItems[index].quantity ++;
                                                      calculateTotalPrice(widget.cartItems[index].discPrice);
                                                      calculate();
                                                    }
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.add_circle,
                                                  color: AppColors.darkColor,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
                    : const Text("Cart is Empty"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../models/product_model.dart';
import '../../utils/color_utils.dart';
import '../../utils/review_format.dart';
import '../../utils/style_utils.dart';
import '../product/product_list.dart';

import 'package:flutter/material.dart';

import '../../utils/review_format.dart';
import '../product/product_list.dart';

class Cart extends StatefulWidget {
  Cart({Key? key, required this.cartItems}) : super(key: key);
  final List<Product> cartItems;

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int count = 0;
  final CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Obx(
                ()=> Text("Subtotal : \$${_cartController.total.value.toStringAsFixed(2)}",
                    style: MyAppStyle.titleStyle(AppColors.darkColor)),
              ),
              const Row(
                children: [
                  Icon(Icons.task_alt_rounded),
                  Text("Your order is eligible for free Delivery"),
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              Center(
                child: (widget.cartItems.isNotEmpty)
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.cartItems.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(
                                top: 8.0, left: 8.0, right: 8.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.accentColor)),
                            child: Row(
                              children: [
                                Image(
                                  image:
                                      AssetImage(widget.cartItems[index].image),
                                  height: 110.0,
                                  width: 110.0,
                                  fit: BoxFit.cover,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(widget.cartItems[index].name,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 16.0)),
                                        Text(
                                            widget.cartItems[index].description,
                                            style: const TextStyle(
                                                fontSize: 12.0,
                                                color: AppColors.kLightColor)),
                                        Row(
                                          children: [
                                            Text(
                                              "\$${widget.cartItems[index].discPrice}",
                                              style: MyAppStyle.priceStyle(
                                                  AppColors.darkColor, false),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "\$ ${widget.cartItems[index].realPrice.toString()}",
                                              style: MyAppStyle.priceStyle(
                                                  AppColors.darkColor, true),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "(${reviewFormat(widget.cartItems[index].reviews)}) Reviews",
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            count != 0
                                                ? IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        count--;
                                                        _cartController
                                                            .decrement(widget
                                                                .cartItems[
                                                                    index]
                                                                .discPrice
                                                                .toDouble());
                                                      });
                                                    },
                                                    icon: const Icon(
                                                      Icons.remove_circle,
                                                      color:
                                                          AppColors.darkColor,
                                                    ),
                                                  )
                                                : Container(),
                                            Container(
                                              width: 44.0,
                                              height: 44.0,
                                              padding: const EdgeInsets.only(
                                                  top: 22.0),
                                              color: AppColors.primaryColor,
                                              child: TextField(
                                                enabled: false,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: count.toString(),
                                                  hintStyle: const TextStyle(
                                                      color:
                                                          AppColors.darkColor),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  count++;
                                                  _cartController.increment(
                                                      widget.cartItems[index]
                                                          .discPrice
                                                          .toDouble());
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.add_circle,
                                                color: AppColors.darkColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
                    : const Text("Cart is Empty"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
