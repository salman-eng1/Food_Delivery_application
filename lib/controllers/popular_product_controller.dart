import 'package:flutter/material.dart';
import 'package:food_delivery_application/controllers/cart_controller.dart';
import 'package:food_delivery_application/data/repository/popular_product_repo.dart';
import 'package:food_delivery_application/model/products_model.dart';
import 'package:food_delivery_application/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList=[];
  List<ProductModel> get popularProductList=>_popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity=0;
  int get quantity=>_quantity;
  int _inCartItems=0;
  int get inCartItems=>_inCartItems+_quantity;
  late CartController _cart;
  

  Future<void> getPopularProductList()async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      _popularProductList=[];
      //here we should extract the data from json and store it in the model
      _popularProductList.addAll(Product.fromJson(response.body).products);

      // print(popularProductList);
      _isLoaded=true;
      //update will refresh the page like set state
      update();
    }else{

    }
  }

  void setQuantity(bool isIncrement){
    if (isIncrement){
      _quantity=checkQuantity(_quantity+1);
    }else{
      _quantity=checkQuantity(_quantity-1);
    }
    update();
  }

  int checkQuantity(int quantity){
    if((_inCartItems+quantity) < 0 ){
      Get.snackbar("Item count", "you can't reduce more",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
      );
      return 0;
    }else if((_inCartItems+quantity) > 20){
      Get.snackbar("Item count", "you can't add more",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    }else {
      return quantity;
    }
  }

  void initProduct(ProductModel product,CartController cart){
    _quantity=0;
    _inCartItems=0;
    _cart=cart;
    var exist=false;
    exist=_cart.existInCart(product);
    if(exist){
      _inCartItems=_cart.getQuantity(product);
      print('the quantity in the cart is ${_inCartItems.toString()}');
    }
    print('exist or not ${exist.toString()}');
    //if exist
    //get from storage _inCartItems=number
  }

  void addItem(ProductModel product){
    //if (quantity>0){
      _cart.addItem(product, _quantity);
      _quantity=0;
      _inCartItems=_cart.getQuantity(product);
      _cart.items.forEach((key, value) {
        print('the key is ${value.id.toString()}'+'the quantity is${value.quantity.toString()}');
      });
    //} else{
    //   Get.snackbar("Item count", "you should at least add an item to the cart",
    //     backgroundColor: AppColors.mainColor,
    //     colorText: Colors.white,
    //   );
    // }
  }

}