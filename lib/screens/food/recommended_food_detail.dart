import 'package:flutter/material.dart';
import 'package:food_delivery_application/routes/route_helper.dart';
import 'package:food_delivery_application/utils/colors.dart';
import 'package:food_delivery_application/utils/dimensions.dart';
import 'package:food_delivery_application/widgets/app_icon.dart';
import 'package:food_delivery_application/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                padding: EdgeInsets.only(top: 5,bottom: 10),
                child: Center(child: BigText(text:'Chinese Side',size:Dimensions.font26)),
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
              background: Image.asset(
                  'assets/image/food0.png',
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
                      text:'Chicken marinated in a spiced voghurt is placed in a large pot fresh coriander cilantro ,then par boiled lightly spiced rice,Chicken marinated in a spiced voghurt is placed in a large pot,then layerd with fried onions, fresh coriander cilantro ,then par boiled lightly spiced rice,Chicken marinated in a spiced voghurt is placed in a large pot,then layerd with fried onions, fresh coriander cilantro ,then par boiled lightly spiced rice,Chicken marinated in a spiced voghurt is placed in a large pot,then layerd with fried onions, fresh coriander cilantro ,then par boiled lightly spiced rice,Chicken marinated in a spiced voghurt is placed in a large pot,then layerd with fried onions, fresh coriander cilantro ,then par boiled lightly spiced rice Chicken marinated in a spiced voghurt is placed in a large pot fresh coriander cilantro ,then par boiled lightly spiced rice,Chicken marinated in a spiced voghurt is placed in a large pot,then layerd with fried onions, fresh coriander cilantro ,then par boiled lightly spiced rice,Chicken marinated in a spiced voghurt is placed in a large pot,then layerd with fried onions, fresh coriander cilantro ,then par boiled lightly spiced rice,Chicken marinated in a spiced voghurt is placed in a large pot,then layerd with fried onions, fresh coriander cilantro ,then par boiled lightly spiced rice,Chicken marinated in a spiced voghurt is placed in a large pot,then layerd with fried onions, fresh coriander cilantro ,then par boiled lightly spiced rice Chicken marinated in a spiced voghurt is placed in a large pot fresh coriander cilantro ,then par boiled lightly spiced rice,Chicken marinated in a spiced voghurt is placed in a large pot,then layerd with fried onions, fresh coriander cilantro ,then par boiled lightly spiced rice,Chicken marinated in a spiced voghurt is placed in a large pot,then layerd with fried onions, fresh coriander cilantro ,then par boiled lightly spiced rice,Chicken marinated in a spiced voghurt is placed in a large pot,then layerd with fried onions, fresh coriander cilantro ,then par boiled lightly spiced rice,Chicken marinated in a spiced voghurt is placed in a large pot,then layerd with fried onions, fresh coriander cilantro ,then par boiled lightly spiced rice Chicken marinated in a spiced voghurt is placed in a large pot fresh coriander cilantro ,then par boiled lightly spiced rice,Chicken marinated in a spiced voghurt is placed in a large pot,then layerd with fried onions, fresh coriander cilantro ,then par boiled lightly spiced rice,Chicken marinated in a spiced voghurt is placed in a large pot,then layerd with fried onions, fresh coriander cilantro ,then par boiled lightly spiced rice,Chicken marinated in a spiced voghurt is placed in a large pot,then layerd with fried onions, fresh coriander cilantro ,then par boiled lightly spiced rice,Chicken marinated in a spiced voghurt is placed in a large pot,then layerd with fried onions, fresh coriander cilantro ,then par boiled lightly spiced rice '
                  ),
                ),

              ],
            )
          ),
        ],
      ),
      bottomNavigationBar: Column(
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
                AppIcon(icon: Icons.remove,backgroundColor: AppColors.mainColor,iconColor: Colors.white,iconSize: Dimensions.iconSize24,),
                BigText(text: '\$12.88 '+' X '+' 0 ',color: AppColors.mainBlackColor,size: Dimensions.font26,),
                AppIcon(icon: Icons.add,backgroundColor: AppColors.mainColor,iconColor: Colors.white,iconSize: Dimensions.iconSize24,),
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
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height10*2,bottom: Dimensions.height10*2,left: Dimensions.width10*2,right: Dimensions.width10*2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor
                  ),
                  child: BigText(text: '\$10 | Add to Cart',color: Colors.white,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
