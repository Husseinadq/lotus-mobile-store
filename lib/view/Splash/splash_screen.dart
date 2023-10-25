import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louts_mobile_store/controller/cart_controller.dart';
import 'package:louts_mobile_store/controller/category_controller.dart';
import 'package:louts_mobile_store/controller/product_controller.dart';
import 'package:louts_mobile_store/controller/user_controller.dart';
import 'package:louts_mobile_store/controller/wishlist_controller.dart';
import 'package:louts_mobile_store/utils/app_colors.dart';

import '../../controller/setting_controller.dart';
import '/routes/route_app.dart';
import '/utils/app_dimensions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<UserController>().initialized;
    Get.find<CategoryController>().initialized;
     Get.find<ProductController>().initialized;
     Get.find<ProductController>().getAllProducts();
    Get.find<CartController>().initialized;
    Get.find<WishlistController>().initialized;
    Get.find<SettingController>().initialized;
     Get.find<SettingController>().readThemeData();

    Timer(const Duration(milliseconds: 1000), () {
      Get.toNamed(RouteApp.getStart());
    });
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: AppDimensions.height300,
            child: Image.asset(
              "assets/images/lotus.png",
            ),
          ),
          SizedBox(
            height: AppDimensions.height20,
          ),
          Text(
            "LOTUS SHOPE",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 40,
                color: AppColors.secondry),
          ),
          SizedBox(
            height: AppDimensions.height40,
          ),
          CircularProgressIndicator(
            color: AppColors.primary,
          )
        ],
      )),
    );
  }
}
