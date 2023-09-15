import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louts_mobile_store/controller/cart_controller.dart';
import 'package:louts_mobile_store/utils/app_colors.dart';
import 'package:louts_mobile_store/utils/app_dimensions.dart';
import 'package:louts_mobile_store/view/cart/product_cart_widget.dart';
import 'package:louts_mobile_store/widget/app_bar_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getAllCartItems();
    return Scaffold(
      body: SizedBox(
        height: AppDimensions.screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarWidget(),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(
                      left: AppDimensions.width10,
                      bottom: AppDimensions.height20,
                      top: AppDimensions.height20,
                    ),
                    child: Text(
                      "My Cart",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppDimensions.size20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GetBuilder<CartController>(
                        builder: ((cartController) => cartController.isLoaded
                            ? ListView.builder(
                                itemCount: cartController.cartItems.length,
                                itemBuilder: (context, index) =>
                                    ProductCartWidget(
                                      item: cartController.cartItems[index],
                                    ))
                            : Center(
                                child: CircularProgressIndicator(
                                    color: AppColors.primary),
                              ))),
                  )

                  // ProductCartCard(),
                  // ProductCartCard()
                ],
              ),
            ),
            Column(
              children: [
                Divider(),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      Spacer(),
                      Text(
                        "567.85 USD",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 12, left: 20, right: 20),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  // height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                  child: Center(
                      child: Get.find<CartController>().totalItem != 0
                          ? Text(
                               "Checkout " +
                                  "${Get.find<CartController>().totalItem} Items",
                              
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.secondry),
                            )),
                ),
              ],
            )
          ],
        ),
      ),
      //  bottomNavigationBar:AppConstants.IS_FROM_OUT_ROUT? BottomNavBar():SizedBox(height: 0,),
    );
  }
}
