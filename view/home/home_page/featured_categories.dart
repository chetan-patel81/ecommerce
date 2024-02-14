import 'package:flutter/material.dart';



import '../../../utils/color_utils.dart';
import '../../../utils/img_utils.dart';
import '../../../utils/style_utils.dart';

class FeaturedCategories extends StatelessWidget {
  FeaturedCategories({super.key});

  List imgList = [
    AppImages.fShirt1,
    AppImages.fShirt2,
    AppImages.fPent1,
    AppImages.fPent2,
  ];
  List nameList = ["t-shirt", "shirt", "Jeans", "Shorts"];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xFFFACC42),
      height: size.height / 3.5,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Featured Categories",
              style: MyAppStyle.nameStyle(
                AppColors.darkColor,
              ),
            ),
            SizedBox(height: 8),
            // Using ListView.builder to display images and names
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  imgList.length,
                  (index) =>
                      buildCategoryItem(imgList[index], nameList[index], size),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryItem(String imageUrl, String categoryName, size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: size.width * 0.17,
            // Adjust the width as a percentage of the screen width
            height: size.height * 0.13,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  imageUrl,
                ),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColors.darkColor)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 14),
              child: Text(
                categoryName,
                style: MyAppStyle.titleStyle(AppColors.darkColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
