import 'package:yabisaba/data/api/api_client.dart';
import 'package:yabisaba/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    //Repository calls a method from the api client
    return await apiClient.getData(
        AppConstants.POPULAR_PRODUCT_URI); //This Endpoint is from the server
  }
}
