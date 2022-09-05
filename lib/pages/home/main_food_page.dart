import 'package:yabisaba/controllers/recommended_product_controller.dart';
import 'package:yabisaba/pages/home/food_page_body.dart';
import 'package:yabisaba/utils/colors.dart';
import 'package:yabisaba/utils/dimensions.dart';
import 'package:yabisaba/widgets/big_text.dart';
import 'package:yabisaba/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    // print("Main height is: " + MediaQuery.of(context).size.height.toString());
    return RefreshIndicator(
        child: Column(
          children: [
            //showing the header
            Container(
              child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height45, bottom: Dimensions.height15),
                padding: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        // Text("Country"),
                        BigText(
                          text: "South Africa",
                          color: AppColors.mainColor,
                        ),
                        // Text("City"),
                        Row(
                          children: [
                            SmallText(
                              text: "Cape Town",
                              color: Colors.black54,
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                            ),
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimensions.height45,
                        height: Dimensions.height45,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: Dimensions.iconSize24,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Showing the body
            Expanded(
                child: SingleChildScrollView(
              child: FoodPageBody(),
            ))
          ],
        ),
        onRefresh: _loadResource);
  }
}
