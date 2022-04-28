import 'package:flutter/material.dart';
import 'package:food_delivery_application/data/api/api_client.dart';
import 'package:food_delivery_application/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo{
  ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList()async{
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}