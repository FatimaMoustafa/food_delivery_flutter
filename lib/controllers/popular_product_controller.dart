import 'package:ecommerce_app_food_delivery/controllers/cart_controller.dart';
import 'package:ecommerce_app_food_delivery/core/widgets/show_snackbar.dart';
import 'package:ecommerce_app_food_delivery/helper/data/repository/popular_product_repo.dart';
import 'package:ecommerce_app_food_delivery/models/cart_model.dart';
import 'package:ecommerce_app_food_delivery/models/popular_products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      print("get products");
      _popularProductList = [];
      _popularProductList.addAll(PopularProductsModel.fromJson(response.body).products);
      print(_popularProductList);
      _isLoaded=true;
      update(); // as setState
    }else{
      print("error");
    }
  }

  void setQuantity(bool isIncrement, BuildContext context){
    if(isIncrement){
      print("increment");
      _quantity = checkQuantity(_quantity+1);
      if((_inCartItems+quantity) >= 50){
        SnackHelper.show(
          context,
          title: "Item count",
          message: "You can't add more !",
        );
      }
    }else{
      _quantity= checkQuantity(_quantity-1);
      print("decrement");
      if((_inCartItems+quantity)<0){
        SnackHelper.show(
          context ,
          title: "Item count",
          message: "You can't reduce more !",
        );
      }
    }
    update();
  }


  int checkQuantity(int quantity){
    if(quantity<0){
      if(_inCartItems>0){
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    }else if(quantity>50){
      return 50;
    }else{
      return quantity;
    }
  }

  void initProduct(ProductModel product,CartController cart){
    _quantity = 0;
    _inCartItems = 0; // get from storage
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    print("exist or not? ${exist.toString()}");
    if(exist){
      _inCartItems = cart.getQuantity(product);
    }
    print("the Quantity in the cart is ${_inCartItems.toString()}");
  }

  void addItem(BuildContext context, ProductModel product){
      _cart.addItem(product, _quantity);
      _quantity=0;
      _inCartItems = _cart.getQuantity(product);

      _cart.items.forEach((key, value){
        print("This id is ${value.id.toString()}, The quantity is ${value.quantity.toString()}");
      });
      update();
  }

  int get totalItems{
    return _cart.totalItems;
  }

  List<CartModel> get getItems{
    return _cart.getItems;
  }
}
