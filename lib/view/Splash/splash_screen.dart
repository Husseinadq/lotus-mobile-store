import 'package:flutter/material.dart';
import 'package:louts_mobile_store/utils/app_dimensions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: AppDimensions.height300,
            child: Image.asset(
              "assets/images/slide3.png",
            ),
          ),
          SizedBox(height: AppDimensions.height20,),
          const Text(
            "LOTUS SHOPE",
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 40,),
          )
        ],
      )),
    );
  }
}
