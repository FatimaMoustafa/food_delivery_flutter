import 'package:ecommerce_app_food_delivery/core/styling/app_colors.dart';
import 'package:ecommerce_app_food_delivery/helper/data/repository/cart_repo.dart';
import 'package:ecommerce_app_food_delivery/models/popular_products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/cart_model.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items={};
  Map<int, CartModel> get items => _items;

  List<CartModel> storageItems = [];

  var cartHistory = <CartModel>[].obs;

  void addItem(ProductModel product, int quantity){
    var totalQuantity = 0;
    // print("Length of the items is: ${_items.length}");
    // _items.putIfAbsent(product.id!, () {
    //   print("adding item to the cart id: ${product.id!} quantity: $quantity");
    //   _items.forEach((key, value){
    //     print("Quantity is: ${value.quantity}");
    //   });

    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value){
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });
      if(totalQuantity <=0){
        _items.remove(product.id);
      }
    }else{
      if(quantity >0){
        _items.putIfAbsent(product.id!, (){
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
          );
        });
      }else{
        Get.snackbar(
            "Item count",
            "You should at least add an item in the cart !",
          backgroundColor: AppColors.primaryColor,
          colorText: Colors.white,
        );
        // SnackHelper.show(
        //   context,
        //   title: "Item count",
        //   message: "You should at least add an item in the cart !",
        // );
      }
    }
    cartRepo.addToCartList(getItems);
    update();
    }

  bool existInCart(ProductModel product){
    if(_items.containsKey(product.id)){
      return true;
    }else{
      return false;
    }
  }

  int getQuantity(ProductModel product){
    var quantity = 0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value){
        if(key == product.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems{
    var totalQuantity = 0;
    _items.forEach((key, value){
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems{
    return _items.entries.map((e){
      return e.value;
    }).toList();
  }

  int get totalAmount{
    var total=0;
    _items.forEach((key, value){
      total += value.quantity! * value.price!;
    });
    return total;
  }

  List<CartModel> getCartData(){
    setCart = cartRepo.getCartList();
    return storageItems;
  }

  set setCart(List<CartModel> items){
    storageItems = items;
    print("length of cart items: ${storageItems.length.toString()}");
    for(int i = 0; i< storageItems.length; i++){
      _items.putIfAbsent(
        storageItems[i].product!.id!,
          () => storageItems[i]
      );
    }
  }

  void addToHistory(){
    cartRepo.addToCartHistoryList();
    cartHistory.value = cartRepo.getCartHistoryList();
    clear();
  }

  void clear(){
    _items = {};
    update();
    }

  List<CartModel> getCartHistoryList(){
    // cartHistory.value = cartRepo.getCartHistoryList();
    return cartRepo.getCartHistoryList();
  }

  set setItems(Map<int, CartModel> setItems){
    _items = {};
    _items = setItems;
  }

  void addToCartList(){
    cartRepo.addToCartList(getItems);
    update();
  }

}
