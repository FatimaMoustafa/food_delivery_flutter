import 'package:ecommerce_app_food_delivery/controllers/cart_controller.dart';
import 'package:ecommerce_app_food_delivery/controllers/popular_product_controller.dart';
import 'package:ecommerce_app_food_delivery/core/utils/app_constants.dart';
import 'package:ecommerce_app_food_delivery/helper/data/api/api_client.dart';
import 'package:ecommerce_app_food_delivery/helper/data/repository/cart_repo.dart';
import 'package:ecommerce_app_food_delivery/helper/data/repository/popular_product_repo.dart';
import 'package:ecommerce_app_food_delivery/helper/data/repository/recommended_product_repo.dart';
import 'package:get/get.dart';
import '../controllers/recommended_product_controller.dart';

Future <void> init() async{
  // api client
  Get.lazyPut(()=> ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(()=> PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=> RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=> CartRepo());

  //controllers
  Get.lazyPut(()=> PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(()=> RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(()=> CartController(cartRepo: Get.find()));

}
