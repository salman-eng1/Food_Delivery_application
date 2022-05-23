import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_application/controllers/cart_controller.dart';
import 'package:food_delivery_application/utils/app_constants.dart';
import 'package:food_delivery_application/utils/colors.dart';
import 'package:food_delivery_application/utils/dimensions.dart';
import 'package:food_delivery_application/widgets/app_icon.dart';
import 'package:food_delivery_application/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../widgets/small_text.dart';
import '../home/main_food_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height10*3,
            left: Dimensions.width10*2,
              right: Dimensions.width10*2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                    },
                    child: AppIcon(icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  SizedBox(width: Dimensions.width10*10,),

                  GestureDetector(
                    onTap:(){
                      Get.to(()=>MainFoodPage());
                    },
                    child: AppIcon(icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  AppIcon(icon: Icons.add_shopping_cart_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
          ],)),
          Positioned(
            top: Dimensions.height10*10,
              left: Dimensions.width10*2,
              right: Dimensions.width10*2,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>( builder: (cartController){
                        return ListView.builder(
                            itemCount: cartController.getItems.length,
                            itemBuilder:(_,index){
                              return Container(
                                height: Dimensions.height10*10,
                                width: double.maxFinite,
                                child: Row(
                                  children: [
                                    Container(
                                      width: Dimensions.height10*10,
                                      height: Dimensions.height10*10,
                                      margin: EdgeInsets.only(bottom: Dimensions.height10),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            AppConstants.BASE_URL+'/uploads/'+cartController.getItems[index].img!
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: Dimensions.width10,),
                                    Expanded(child: Container(
                                      height: Dimensions.height10*10,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(text: cartController.getItems[index].name!,color: Colors.black54,),
                                          SmallText(text:'spicy'),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigText(text: cartController.getItems[index].price.toString(),color: Colors.redAccent,),
                                              Container(
                                                padding: EdgeInsets.only(top: Dimensions.height10,bottom: Dimensions.height10,left: Dimensions.width10,right: Dimensions.width10),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                    color: Colors.white
                                                ),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                        onTap: (){
                                                          // popularProduct.setQuantity(false);
                                                        },
                                                        child: Icon(Icons.remove,color: AppColors.signColor,))  ,
                                                    SizedBox(width: Dimensions.width10/2,),
                                                    BigText(text: '0'),
                                                    SizedBox(width: Dimensions.width10/2,),
                                                    GestureDetector(
                                                        onTap: (){
                                                          // popularProduct.setQuantity(true);
                                                        },
                                                        child: Icon(Icons.add,color: AppColors.signColor,))
                                                  ],
                                                ),
                                              ),

                                            ],
                                          )
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              );
                            } );
                      }
                  ),
                ),
          )),
        ],
      ),
    );
  }
}
