import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louts_mobile_store/controller/wishlist_controller.dart';
import 'package:louts_mobile_store/utils/app_colors.dart';
import 'package:louts_mobile_store/utils/app_dimensions.dart';
import 'package:louts_mobile_store/view/wishlist/product_wishlist_widget.dart';
import 'package:louts_mobile_store/widget/app_bar_widget.dart';


class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<WishlistController>().getAllWishlistItems();
    return Scaffold(
      body: Container(
        height: AppDimensions.screenHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(),
            Container(
              height: AppDimensions.height50,
              margin: EdgeInsets.only(
                left: AppDimensions.width10,
                bottom: AppDimensions.height20,
                top: AppDimensions.height20,
              ),
              child: Text(
                "My Wishlist",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppDimensions.size20,
                ),
              ),
            ),
            Expanded(
              child: GetBuilder<WishlistController>(
                  builder: ((wishlistController) => wishlistController.isLoaded
                      ? ListView.builder(
                          itemCount: wishlistController.wishlistItems.length,
                          itemBuilder: (context, index) => ProductWishlistWidget(
                                item: wishlistController.wishlistItems[index],
                              ))
                      : Center(
                          child: CircularProgressIndicator(
                              color: AppColors.secondry),
                        ))),
            )

            // ProductCartCard(),
            // ProductCartCard()
          ],
        ),
      ),
      // bottomNavigationBar: AppConstants.IS_FROM_OUT_ROUT
      //     ? BottomNavBar()
      //     : SizedBox(
      //         height: 0,
      //       ),
    );
  }
}
