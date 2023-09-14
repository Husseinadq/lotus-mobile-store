import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louts_mobile_store/utils/app_colors.dart';
import 'package:louts_mobile_store/utils/app_dimensions.dart';


class ProductCard extends StatelessWidget {
  // final Product product;
  ProductCard({super.key,
  //  required this.product
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print(" id = ${product.id}");

        //  Get.find<ProductController>().getSinglProducts(2);
        // Get.toNamed(RouteHelper.getProduct());
        // Get.find<ProductController>().getSinglProducts(product.id!);
        // Get.toNamed(RouteHelper.getProduct());
      },
      child: Card(
        elevation: 2,
        child: Container(
          margin: EdgeInsets.only(
              left: AppDimensions.width3, right: AppDimensions.width3),
          padding: EdgeInsets.only(
              left: AppDimensions.width2, right: AppDimensions.width2),
          height: AppDimensions.height300,
          width: AppDimensions.width150,
          decoration: BoxDecoration(
              color: AppColors.secondry,
              borderRadius: BorderRadius.circular(AppDimensions.size15)),
          child: Column(children: [
            Stack(children: [
              Container(
                height: 180,
                // margin: EdgeInsets.only(
                //     left: Dimensions.width5,
                //     right: Dimensions.width5,
                //     top: Dimensions.height30),
                decoration: BoxDecoration(
                    color: AppColors.lightgrey,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(    'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'
                          // product.productImage!
                        ))),
              ),
              // product.discount! > 0
              true
                  ? Positioned(
                      top: 5,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 3, bottom: 3, left: 0, right: 5),
                        // height: Dimensions.height20,
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.only(
                                bottomRight:
                                    Radius.circular(AppDimensions.size20),
                                topRight:
                                    Radius.circular(AppDimensions.size20))),
                        child: Text(
                          '${20
                            // product.discount!.toInt()
                          }% Off', // product discount
                          style: TextStyle(
                              color: AppColors.secondry,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  : Positioned(child: Container()),
              Positioned(
                top: 5,
                right: 5,
                child: InkWell(
                  onTap: () {
                    //  Get.find<WishlistController>()
                    //   .addToWishlist(1, 1, product.id)
                      },
                  child: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      radius: 15,
                      child: Icon(
                        Icons.favorite_border,
                        color: AppColors.secondry,
                        size: 22,
                      )),
                ),
              ),
            ]),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppDimensions.height10,
                  ),
                  Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        // product.brandName.toString(), //product brand
                        'addids',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: AppDimensions.size15),
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 2, bottom: 10),
                    child: Text(
                      // product.name.toString(), //product name
                      'car',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w400,
                          fontSize: AppDimensions.size15),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // product.discount != 0.0
                      true
                          ? Expanded(
                              child: Container(
                                child: Text(
                                  "${20
                                    // product.price
                                  } USD",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w300,
                                      fontSize: AppDimensions.size14),
                                ),
                              ),
                            )
                          : Container(),
                      Expanded(
                        child: Container(
                          child: Text(
                            "${30
                              // Get.find<ProductController>().priceAfterDiscount(product.price!, product.discount!)
                            } USD",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: AppDimensions.size15),
                          ),
                        ),
                      ),
                      // Spacer(
                      //   flex: 2,
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: AppDimensions.height10,
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
