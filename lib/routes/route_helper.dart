import 'package:food_delivery_application/screens/food/popular_food_detail.dart';
import 'package:food_delivery_application/screens/food/recommended_food_detail.dart';
import 'package:food_delivery_application/screens/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String initial ='/';
  static const String popularFood="/popular-food";
  static const String recommendedFood="/recommended-food";


  static String getInitial()=>'$initial';
  static String getPopularFood()=>'$popularFood';
  static String getRecommendedFood()=>'$recommendedFood';


  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>MainFoodPage()),
    GetPage(transition:Transition.fadeIn,name: popularFood, page: (){
      return PopularFoodDetail();
    },
    ),

    GetPage(transition:Transition.fadeIn,name: recommendedFood, page: (){
      return RecommendedFoodDetail();
    },
    ),
  ];
}