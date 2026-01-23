import 'package:ecommerce_app_food_delivery/models/popular_products_model.dart';
import 'package:get/get.dart';

import '../helper/data/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      print("get products");
      _recommendedProductList = [];
      _recommendedProductList.addAll(PopularProductsModel.fromJson(response.body).products);
      print(_recommendedProductList);
      _isLoaded=true;
      update(); // as setState
    }else{
      print("error");
    }
  }
}