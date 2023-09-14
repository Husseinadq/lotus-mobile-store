import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louts_mobile_store/utils/app_colors.dart';

import '/routes/route_app.dart';
import '/utils/app_dimensions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          CircularProgressIndicator(color: AppColors.primary,)
        ],
      )),
    );
  }
}
