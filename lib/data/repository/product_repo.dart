// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get_connect/http/src/response/response.dart';

import '../../utils/app_constants.dart';
import '../api/api_clint.dart';

class ProductRepo {
  final ApiClient apiClient;
  ProductRepo({
    required this.apiClient,
  });
  Future<Response> getAllProducts() async {
    return await apiClient.getData(AppConstants.API_V +
        AppConstants.ALL_PRODUCT +
        AppConstants.KEY +
        AppConstants.LANG); //we bass as url the end point
  }

  Future<Response> getSingleProducts(Map<String, dynamic> data) async {
    return await apiClient.postData(
        AppConstants.API_V +
            AppConstants.SINGLE_PRODUCT +
            AppConstants.KEY +
            AppConstants.LANG,
        data);
  } 
  
  Future<Response> getProductsFromBrand(Map<String, dynamic> data) async {
    return await apiClient.postData(
        AppConstants.API_V +
            AppConstants.GET_PRODUCTS_FROM_BRAND +
            AppConstants.KEY +
            AppConstants.LANG,
        data);
  }
  
  Future<Response> getSearchTitle(String data) async {
    return await apiClient.getData(
        AppConstants.API_V +
            AppConstants.GET_SEARCH_PRODUCTS_TITLES +data+
            AppConstants.KEY +
            AppConstants.LANG,
        );
  }

  Future<Response> getSearchProductResults(String data) async {
    return await apiClient.getData(
        AppConstants.API_V +
            AppConstants.GET_SEARCH_PRODUCTS +data+
            AppConstants.KEY +
            AppConstants.LANG,
        );
  }


 Future<Response> getProductsFromCategory( Map<String, dynamic> data)async{
 return await apiClient.postData(
        AppConstants.API_V +
            AppConstants.GET_PRODUCTS_FROM_CATEGORY+
            AppConstants.KEY +
            AppConstants.LANG,data
        );
  }
}
