import 'package:ecommerce_app/view/home/home_page/category_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/img_utils.dart';
import '../../../utils/style_utils.dart';

class Category extends StatelessWidget {
  Category({super.key});

  List imgList = [
    AppImages.child,
    AppImages.man,
    AppImages.woman,
  ];
  List nameList = [
    "Child",
    "Man",
    "Woman",
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Set Your Wardobe With Our \nAmazing Selection!",
            style: MyAppStyle.nameStyle(AppColors.darkColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              imgList.length,
              (index) => buildCategoryItem(
                  imgList[index], nameList[index], size, context),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCategoryItem(
      String imageUrl, String categoryName, size, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryList(categoryName: categoryName),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.2,
              // Adjust the width as a percentage of the screen width
              height: size.height * 0.2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    imageUrl,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: AppColors.darkColor)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
                child: Text(
                  categoryName,
                  style: MyAppStyle.titleStyle(AppColors.darkColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
