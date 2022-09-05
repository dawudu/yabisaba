import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yabisaba/adverts/landing.dart';
import 'package:yabisaba/utils/colors.dart';
import 'package:yabisaba/utils/dimensions.dart';
import 'package:yabisaba/widgets/big_text.dart';
import 'package:yabisaba/widgets/small_text.dart';

import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_product_controller.dart';
import 'home_rent_detail_page.dart';

class HomeRentHomePage extends StatefulWidget {
  const HomeRentHomePage({Key? key}) : super(key: key);

  @override
  _HomeRentHomePageState createState() => _HomeRentHomePageState();
}

class _HomeRentHomePageState extends State<HomeRentHomePage> {
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  int _bottomIdx = 0;

  @override
  Widget build(BuildContext context) {
    // print("Main height is: " + MediaQuery.of(context).size.height.toString());
    return Scaffold(
      // height: 350,
      body: Container(),
    );
  }
}
