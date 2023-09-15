// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:louts_mobile_store/controller/cart_controller.dart';
import 'package:louts_mobile_store/controller/wishlist_controller.dart';
import 'package:louts_mobile_store/model/wishlist_model.dart';
import 'package:louts_mobile_store/utils/app_colors.dart';
import 'package:louts_mobile_store/utils/app_dimensions.dart';

// ignore: must_be_immutable
class ProductWishlistWidget extends StatelessWidget {
  WishlistItem item;
  ProductWishlistWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.size20),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey,
              blurRadius: 5,
              spreadRadius: 0.0,
              offset: Offset(
                0,
                2,
              ),
            )
          ],
          color: Colors.black),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(motion: BehindMotion(), children: [
          GestureDetector(
            onTap: () {},
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.width20,
                    vertical: AppDimensions.height30),
                color: AppColors.secondry,
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 30,
                )),
          ),
          GestureDetector(
            onTap: () {
              Get.find<WishlistController>().removeFromWishlist(item.id!);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.width30,
                  vertical: AppDimensions.height30),
              color: AppColors.secondry,
              child: Icon(
                Icons.delete,
                color: AppColors.primary,
                size: 30,
              ),
            ),
          ),
        ]),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.width10, vertical: AppDimensions.height10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.size20),
              color: AppColors.primary),
          height: AppDimensions.height100,
          width: double.maxFinite,
          child: Row(
            children: [
              Container(
                  width: 100,
                  height: 120,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(AppDimensions.size20)),
                  child: Image.network(
                    item.productImage.toString(),
                    fit: BoxFit.scaleDown,
                  )),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 5, bottom: 5),
                      child: Text(
                        item.productName.toString(),
                        // color: AppColors.secondryAccent,
                      ),
                    ),
                    // Container(
                    //   // width: Dimensions.width200,
                    //   child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Expanded(
                        //     child:
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text("\$${item.price}")),
                        // ),
                        GestureDetector( onTap: (){
                          Get.find<CartController>().addToCart(1, 4, 1);
                        },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.secondry,
                            ),
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
