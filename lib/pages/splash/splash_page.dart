import 'dart:async';

import 'package:yabisaba/pages/home/home_page.dart';
import 'package:yabisaba/routes/route_helper.dart';
import 'package:yabisaba/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:yabisaba/widgets/big_text.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    _loadResource();
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutExpo);

    Timer(
        // const Duration(seconds: 6),
        // () => Get.offNamed(
        //       RouteHelper.getInitial(),

        const Duration(seconds: 20),
        () => Get.offNamed(
              RouteHelper.getSignInPage(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: Dimensions.height20),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/image/videogif.gif"),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: animation,
              child: Center(
                child: Image.asset(
                  "assets/image/yabis.png",
                  width: Dimensions.splashImg,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height20 * 2,
            ),

            BigText(
              text: "Remote CoWorking & Experiences On",
              size: Dimensions.font20,
              color: Colors.white,
            ),
            SizedBox(
              height: Dimensions.height20 * 2,
            ),
            BigText(
              text: "Yachts & Boats",
              size: Dimensions.font26 * 2,
              color: Colors.white,
            )
            // Center(
            //   child: Image.asset(
            //     "assets/image/slogan.png",
            //     width: Dimensions.splashImg,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
