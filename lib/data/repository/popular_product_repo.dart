// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import '/data/api/api_clint.dart';
import '/utils/app_constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({
    required this.apiClient,
  });

  Future<Response> getPopularProductRepoList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URL);//we bass as url the end point
  }
}
