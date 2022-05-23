import 'package:flutter/material.dart';
import 'package:food_delivery_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_application/controllers/recommended_product_controller.dart';
import 'package:food_delivery_application/routes/route_helper.dart';
import 'package:food_delivery_application/screens/cart/cart_page.dart';
import 'package:food_delivery_application/utils/colors.dart';
import 'package:food_delivery_application/utils/dimensions.dart';
import 'package:food_delivery_application/widgets/app_icon.dart';
import 'package:food_delivery_application/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../utils/app_constants.dart';
import '../../widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
   const RecommendedFoodDetail({Key? key,required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product=Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    child: AppIcon(icon: Icons.clear),onTap: (){Get.toNamed(RouteHelper.getInitial());},),
               // AppIcon(icon: Icons.shopping_cart_outlined),
                GetBuilder<PopularProductController>(builder: (controller){
                  return Stack(
                    children: [
                      AppIcon(
                        icon:Icons.shopping_cart_outlined,
                      ),
                      Get.find<PopularProductController>().totalItem>=1?
                      Positioned(
                        right: 0,top:0,
                        child: GestureDetector(
                          onTap:(){
                            Get.to(()=>CartPage());
                          },
                          child: AppIcon(
                            icon:Icons.circle,
                            size: 20.0,
                            iconColor: Colors.transparent,
                            backgroundColor: AppColors.mainColor,
                          ),
                        ),
                      ) :Container(),
                      Get.find<PopularProductController>().totalItem>=1?
                      Positioned(
                        right: 4,top:3,
                        child: BigText(text: Get.find<PopularProductController>().totalItem.toString(),
                          size:12,
                          color:Colors.white,

                        ),
                      ):Container()
                    ],
                  );
                }),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                padding: EdgeInsets.only(top: 5,bottom: 10),
                child: Center(child: BigText(text:product.name!,size:Dimensions.font26)),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20),topRight: Radius.circular(Dimensions.radius20),)
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL+'/uploads/'+product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:Column(
              children: [
                Container(
                  margin:EdgeInsets.only(left: Dimensions.width10*2,right: Dimensions.width10*2),
                  child: ExpandableTextWidget(
                      text: product.description!
                  ),
                ),

              ],
            )
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (contoller){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width10*4.5,
                right: Dimensions.width10*4.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      contoller.setQuantity(false);
                    },
                    child:AppIcon(icon: Icons.remove,backgroundColor: AppColors.mainColor,iconColor: Colors.white,iconSize: Dimensions.iconSize24,),

                  ),
                  BigText(text: '\$ ${product.price}'+' X '+'${contoller.inCartItems} ',color: AppColors.mainBlackColor,size: Dimensions.font26,),
                  GestureDetector(
                    onTap: (){
                      contoller.setQuantity(true);
                    },
                    child:AppIcon(icon: Icons.add,backgroundColor: AppColors.mainColor,iconColor: Colors.white,iconSize: Dimensions.iconSize24,),

                  ),
                ],
              ),
            ),
            Container(
              height: Dimensions.height10*12,
              padding: EdgeInsets.only(top: Dimensions.height10*3,bottom: Dimensions.height10*3,left: Dimensions.width10*2,right: Dimensions.width10*2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20*2),
                  topRight: Radius.circular(Dimensions.radius20*2),
                ),
                color: AppColors.buttonBackgroundColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: Dimensions.height10*2,bottom: Dimensions.height10*2,left: Dimensions.width10*2,right: Dimensions.width10*2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white
                    ),
                    child: Icon(Icons.favorite,color: AppColors.mainColor),
                  ),
            GestureDetector(
              onTap: (){
                contoller.addItem(product);
              },
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height10*2,bottom: Dimensions.height10*2,left: Dimensions.width10*2,right: Dimensions.width10*2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor
                ),
                child: BigText(text: '\$ ${product.price!} | Add to Cart',color: Colors.white,),
              ),
            )
                ],
              ),
            ),
          ],
        );
      }),


    );
  }
}
