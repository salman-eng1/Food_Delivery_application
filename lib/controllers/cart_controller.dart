import 'package:food_delivery_application/model/products_model.dart';
import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';
import '../model/cart_model.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int,CartModel> _items= {};

  void addItem(ProductModel product,int quantity){
    //this will check if the items is exist in the map
    _items.putIfAbsent(product.id!, () {
      return CartModel(
        id:product.id,
        name: product.name,
        price: product.price,
        img: product.img,
        quantity: quantity,
        isExist: true,
        time: DateTime.now().toString(),
      );
    } );
  }
}