import 'package:food_delivery_application/data/repository/popular_product_repo.dart';
import 'package:food_delivery_application/model/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList=>_popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;


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
}