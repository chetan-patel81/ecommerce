

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../models/product_model.dart';
import '../../utils/color_utils.dart';
import '../../utils/review_format.dart';
import '../../utils/style_utils.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.onTap});
final   Function()? onTap;
  final Product product;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width / 2.5,
        child: Column(
          children: [
            Container(
              height: size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.secondaryColor,
                image: DecorationImage(
                  image: AssetImage(product.image),
                  fit: BoxFit.cover, // Adjust as needed
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.black45,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: product.isFavorite
                                ? Colors.red
                                : AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: InkWell(onTap:onTap,
                      child: Container(
                        width: size.width / 2.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.black45,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Center(
                              child: Text(
                            "Add To Cart",
                            style: MyAppStyle.titleStyle(AppColors.whiteColor),
                          )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(product.name),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "\$${product.discPrice}",
                  style: MyAppStyle.priceStyle(AppColors.darkColor, false),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "\$${product.realPrice}",
                  style: MyAppStyle.priceStyle(AppColors.darkColor, true),
                ),
                const SizedBox(
                  width: 10,
                ),

              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "(${reviewFormat(product.reviews)}) Reviews",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
