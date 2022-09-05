import 'package:yabisaba/controllers/auth_controller.dart';
import 'package:yabisaba/controllers/cart_controller.dart';
import 'package:yabisaba/controllers/location_controller.dart';
import 'package:yabisaba/controllers/popular_product_controller.dart';
import 'package:yabisaba/controllers/user_controller.dart';
import 'package:yabisaba/data/api/api_client.dart';
import 'package:yabisaba/data/repository/auth_repo.dart';
import 'package:yabisaba/data/repository/cart_repo.dart';
import 'package:yabisaba/data/repository/location_repo.dart';
import 'package:yabisaba/data/repository/popular_product_repo.dart';
import 'package:yabisaba/data/repository/user_repo.dart';
import 'package:yabisaba/utils/app_constants.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/recommended_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init() async {
  //For SharedPrefrences
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //For ApiClient
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: sharedPreferences));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));

  //For repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(
      () => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  //For controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
}
