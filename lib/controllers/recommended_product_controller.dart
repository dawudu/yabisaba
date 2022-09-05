import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';
import '../models/products_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});
  //PopularProductRepo will return the data here and we will set the data to the list below
  List<dynamic> _recommendedProductList = []; //List
  List<dynamic> get recommendedProductList =>
      _recommendedProductList; //You can call "poplarProductList" directly from anywhere on the UI

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo
        .getRecommendedProductList(); // This line will contain JSON file data from the server
    if (response.statusCode == 200) {
      // print("Got products");
      _recommendedProductList = [];
      _recommendedProductList.addAll(
          Product.fromJson(response.body).products); //Build a model here
      // print(_poplarProductList);
      _isLoaded = true;
      update();
    } else {

        // print("Could not get recommended products");
    }
  }
}
