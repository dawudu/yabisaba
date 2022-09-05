import 'package:yabisaba/controllers/cart_controller.dart';
import 'package:yabisaba/home_rent_home_page.dart';
import 'package:yabisaba/pages/auth/sign_in_page.dart';
import 'package:yabisaba/pages/auth/sign_up_page.dart';
import 'package:yabisaba/pages/cart/cart_page.dart';
import 'package:yabisaba/pages/food/popular_food_detail.dart';
import 'package:yabisaba/pages/food/recommended_food_detail.dart';
import 'package:yabisaba/pages/home/food_page_body.dart';
import 'package:yabisaba/pages/home/main_food_page.dart';
import 'package:yabisaba/pages/splash/splash_page.dart';
import 'package:yabisaba/routes/route_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  // if (defaultTargetPlatform == TargetPlatform.android) {
  //   AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  // }
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          // ),
          // home: SplashScreen(),
          // home: MainFoodPage(),
          // initialRoute: RouteHelper.getInitial(),
          // home: SignInPage(),

          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,

          // home: const RecommendedFoodDetail(),
          // home: const PopularFoodDetail(),
          // home: const MainFoodPage(),
          // home: const HomeRentHomePage(),
        );
      });
    });
  }
}
