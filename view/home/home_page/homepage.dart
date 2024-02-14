import 'package:flutter/material.dart';


import '../../../utils/color_utils.dart';
import '../../../utils/style_utils.dart';
import 'category.dart';
import 'featured_categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notification_add_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_sharp),
            )
          ],
          backgroundColor: AppColors.primaryColor,
          title: Container(
            width: 200,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(14)),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20, // Adjust the radius as needed
                  backgroundImage: AssetImage("assets/images/girlsfashion.jpg"),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Hello Roopa",
                    style: MyAppStyle.titleStyle(Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: size.height / 1.8,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FeaturedCategories(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Make Your Fashion \nLook Mire Charming",
                              style: MyAppStyle.nameStyle(AppColors.darkColor),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      const Text("Price"),
                                      Text(
                                        "\$168",
                                        style: MyAppStyle.headStyle(
                                            AppColors.darkColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * 0.1, //width:40
                                  ),
                                  Column(
                                    children: [
                                      const Text("Selected Size"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const CircleAvatar(
                                            backgroundColor:
                                                AppColors.whiteColor,
                                            child: Text("x"),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.01,
                                          ),
                                          const CircleAvatar(
                                            backgroundColor:
                                                AppColors.whiteColor,
                                            child: Text("M"),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.01,
                                          ),
                                          const CircleAvatar(
                                            backgroundColor:
                                                AppColors.whiteColor,
                                            child: Text("s"),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: AppColors
                                      .darkColor, // Set border color to black
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 12.0),
                                child: Center(
                                    child: Text(
                                  "View Details",
                                  style: MyAppStyle.titleStyle(
                                      AppColors.darkColor),
                                )),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: size.height / 3.5,
                            width: size.width / 3,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/girlsfashion.jpg"),
                                fit: BoxFit.cover, // Adjust as needed
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Category(),

            ],
          ),
        ),
      ),
    );
  }
}
