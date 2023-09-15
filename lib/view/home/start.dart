import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:louts_mobile_store/utils/app_colors.dart';
import 'package:louts_mobile_store/utils/app_constants.dart';
import 'package:louts_mobile_store/utils/app_dimensions.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {

  
    return SafeArea(
      child: Scaffold(
        body: Container(child: AppConstants.NAV_BAR_SCREEN[AppConstants.PAGENUMBER]),
        bottomNavigationBar: CurvedNavigationBar(
            key: AppConstants.bottomNavigationKey,
            height: AppDimensions.height60,
            onTap: (index) {
              setState(() {
                AppConstants.PAGENUMBER=index;
              });
            },
            index: AppConstants.PAGENUMBER,
            backgroundColor: AppColors.secondry,
            color: AppColors.primary,
            animationDuration: const Duration(milliseconds: 600),
            items: [
              CurvedNavigationBarItem(
                  child: Icon(
                    Icons.home,
                    size: 30,
                    color: AppColors.secondry,
                  ),
                  label: 'Home',
                  labelStyle: TextStyle(color: AppColors.secondry)),
              CurvedNavigationBarItem(
                  child: Icon(
                    Icons.category,
                    size: 30,
                    color: AppColors.secondry,
                  ),
                  label: 'Category',
                  labelStyle: TextStyle(color: AppColors.secondry)),
              CurvedNavigationBarItem(
                label: 'Cart',
                labelStyle: TextStyle(color: AppColors.secondry),
                child: Stack(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: 30,
                      color: AppColors.secondry,
                    ),
                    // Get.find<CartController>().totalItem > 0
                    false
                        ? Positioned(
                            right: 8,
                            top: 4,
                            child: Center(
                                child: Text(
                              // Get.find<CartController>().totalItem.toString(),
                              '0',
                              style: TextStyle(
                                  color: AppColors.secondry,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )))
                        : Positioned(right: 0, top: 0, child: Text("")),
                  ],
                ),
              ),
              CurvedNavigationBarItem(
                label: 'WishList',
                labelStyle: TextStyle(color: AppColors.secondry),
                child: Stack(children: [
                  Icon(
                    Icons.favorite,
                    size: 30,
                    color: AppColors.secondry,
                  ),
                  // Get.find<WishlistController>().wishlistItems.length > 0
                  true
                      ? Positioned(
                          right: 10,
                          top: 6,
                          child: Center(
                              child: Text(
                            // Get.find<WishlistController>()
                            //     .wishlistItems
                            //     .length
                            //     .toString(),
                            '0',
                            style: TextStyle(
                                color: AppColors.secondry,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )))
                      : Positioned(right: 0, top: 0, child: Text("")),
                ]),
              ),
              CurvedNavigationBarItem(
                label: 'Profile',
                labelStyle: TextStyle(color: AppColors.secondry),
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: AppColors.secondry,
                ),
              ),
            ]),
      ),
    );
  }
}
