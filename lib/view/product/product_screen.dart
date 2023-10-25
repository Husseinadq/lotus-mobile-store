// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:louts_mobile_store/utils/app_dimensions.dart';

import '../../controller/cart_controller.dart';
import '../../controller/product_controller.dart';
import '../../controller/wishlist_controller.dart';
import '../../model/products.dart';
import '../../routes/route_app.dart';
import '../../utils/app_colors.dart';
import '../../widget/carousel_slider_widget.dart';
import '../../widget/section_widget.dart';
import 'product_detail_card.dart';
import 'seller_card.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ProductsItem productsItem = Get.find<ProductController>().productItme;
    // Get.find<ProductController>().getProductsFromBrand(productsItem.brandId!);
    return Scaffold(
      body: FutureBuilder(
        future: Get.find<ProductController>()
            .getSinglProduct(Get.find<ProductController>().getSelectedProduct),
        builder: (context, snapshot) {
          print('snapshot error = ${snapshot.error}');
          print('snapshot state = ${snapshot.connectionState}');
          print('snapshot has data = ${snapshot.data!.name}');

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            print('snapshot=${snapshot}');
            return Text('something want rong');
          }

          if (snapshot.hasData) {
            // Get.find<ProductController>().getProductsFromBrand(
            //     Get.find<ProductController>().productItme.brandId!);

            return Container(
              height: AppDimensions.screenHeight,
              width: AppDimensions.screenWidth,
              color: AppColors.secondry,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                            backgroundColor: AppColors.secondry,
                            pinned: false,
                            floating: true,
                            expandedHeight: 300,
                            automaticallyImplyLeading: false,
                            title: Expanded(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: AppColors.primary,
                                  ),
                                ),
                                Spacer(),
                                Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // Get.toNamed(RouteApp.getMainPage());
                                        // AppConstants.navigationKey.currentState!
                                        //     .setPage(2);
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.grey,
                                        radius: 20,
                                        child: Icon(
                                          Icons.shopping_cart,
                                          color: AppColors.primary,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 3,
                                        right: 3,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.red,
                                          radius: 7,
                                          child: Text(
                                            '2',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200,
                                                fontSize: 12,
                                                color: AppColors.secondry),
                                          ),
                                        ))
                                  ],
                                ),
                              ],
                            )),
                            flexibleSpace: FlexibleSpaceBar(
                              expandedTitleScale: 1,
                              centerTitle: true,
                              background: Container(
                                height: 300,
                                width: 200,
                                color: AppColors.secondry,
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        CarouselSliderWidget(
                                          // product image slider
                                          size: 300,
                                          autoplay: false,
                                          photos:
                                              Get.find<ProductController>()
                                                  .productItme
                                                  .productImages,
                                        ),
                                        // Positioned(
                                        //   top: 5,
                                        //   right: 5,
                                        //   child: CircleAvatar(
                                        //       backgroundColor: AppColors.primary,
                                        //       radius: 20,
                                        //       child: Icon(
                                        //         Icons.favorite_border,
                                        //         color: AppColors.secondry,
                                        //         size: 22,
                                        //       )),
                                        // ),

                                        Positioned(
                                          bottom: 5,
                                          right: 5,
                                          child: InkWell(
                                            //TODO user id
                                            onTap: () => Get.find<
                                                    WishlistController>()
                                                .addToWishlist(
                                                    1,
                                                    1,
                                                    Get.find<
                                                            ProductController>()
                                                        .productItme
                                                        .id),
                                            child: CircleAvatar(
                                                backgroundColor:
                                                    AppColors.grey,
                                                radius: 20,
                                                child: Icon(
                                                  Icons.favorite_border,
                                                  color: AppColors.primary,
                                                  size: 22,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        SliverList(
                            delegate: SliverChildListDelegate([
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(left: 5, right: 5),
                            color: AppColors.secondry,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${Get.find<ProductController>().productItme.brandId}", //product prand is here
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  Get.find<ProductController>()
                                      .productItme
                                      .name!, //product name is here
                                  style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Get.find<ProductController>()
                                                .isThereDiscount ==
                                            true
                                        ? Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: [
                                                Text(
                                                  "${Get.find<ProductController>().productItme.price!.toStringAsFixed(2)} USD", //old price
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration
                                                              .lineThrough,
                                                      color: AppColors
                                                          .secondryAccent,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: AppDimensions
                                                          .size20),
                                                ),
                                              ],
                                            ))
                                        : Container(),
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Spacer(
                                          //   flex: 1,
                                          // ),
                                          Text(
                                            "${Get.find<ProductController>().priceAfterDiscount(Get.find<ProductController>().productItme.price!, Get.find<ProductController>().productItme.discount!).toStringAsFixed(2)} USD",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    AppDimensions.size20),
                                          ),

                                          Get.find<ProductController>()
                                                      .isThereDiscount ==
                                                  true //is there discoutn cond
                                              ? Container(
                                                  // margin: EdgeInsets.only(right: ),
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color:
                                                            AppColors.primary,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(10)),
                                                  child: Text(
                                                    "${Get.find<ProductController>().productItme.discount!.toInt()}% OFF", // discount number
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            AppDimensions
                                                                .size15),
                                                  ),
                                                )
                                              : Container()
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 5,
                                ),
                                Divider(),
                                SellerCard(),
                                Divider(),
                                ProductDetailCard(
                                    overview: Get.find<ProductController>()
                                        .productItme
                                        .description!),

                                FutureBuilder(
                                    future: Get.find<ProductController>()
                                        .getProductsFromBrand(
                                            Get.find<ProductController>()
                                                .productItme
                                                .brandId!),
                                    builder: (context, snapshot) {
                                      // Container(height: 20,width: 20,color: Colors.amber,)
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      if (snapshot.hasError) {
                                        return Text("errror");
                                      }
                                      return Section(
                                        title:
                                            'More from ${Get.find<ProductController>().productsBrand[0].brandName}',
                                        items: Get.find<ProductController>()
                                            .productsBrand,
                                      );
                                    }

                                    // GetBuilder<ProductController>(
                                    //     builder: (productController) =>
                                    //         Section(
                                    //           title:
                                    //               'More from ${Get.find<ProductController>().productsBrand[0].brandName}',
                                    //           items: productController
                                    //               .productsBrand,
                                    //         )),
                                    ),

                                GetBuilder<ProductController>(
                                    builder: (productController) => Section(
                                          title: 'Similar products',
                                          items: productController.products,
                                        )),
                              ],
                            ),
                          )
                        ]))
                      ],
                    ),
                  ),
                  // Expanded(
                  //   child: Container(
                  //     height: 200,
                  //     color: Colors.red,
                  //     width: 200,
                  //   ),
                  // ),
                  ProductBottomBar()
                ],
              ),
            );
          }
          return Text("data");
        },
      ),
      // bottomNavigationBar:BottomNavigationBar(items: [],)
    );
  }
}

class ProductBottomBar extends StatefulWidget {
  const ProductBottomBar({super.key});

  @override
  State<ProductBottomBar> createState() => _ProductBottomBarState();
}

class _ProductBottomBarState extends State<ProductBottomBar> {
  bool _isSetQTY = false;
  int _QTY = 1;
  bool _isAddingToCart = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          _isSetQTY == true
              ? Container(
                  height: 75,
                  child: Column(
                    children: [
                      Divider(),
                      Expanded(
                        child: Container(
                          // height: 40,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) => InkWell(
                                    onTap: (() {
                                      _QTY = index + 1;
                                      setState(() {
                                        _isSetQTY = !_isSetQTY;
                                      });
                                    }),
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AppColors.lightgrey),
                                      child: Text(
                                        '${index + 1}',
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                )
              : Divider(),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_isSetQTY == true) {
                      _isSetQTY = false;
                    } else {
                      _isSetQTY = true;
                    }
                  });
                },
                child: Container(
                  
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColors.primary,
                        width: 1,
                      ),
                      color: AppColors.secondry),
                  child: Column(
                    children: [
                      Text(
                        "QTY",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                      Text(
                        _QTY.toString(),
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    //TODO chand fixed user id and product id
                    Get.find<CartController>().addToCart(1, 1, _QTY);
                    setState(() {
                      _isAddingToCart = true;
                    });
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.primary,
                           border: Border.all(
                        color: AppColors.primary,
                        width: 1,
                      ),
                          ),
                      child: _isAddingToCart == false
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Add to cart ",
                                  style: TextStyle(
                                      color: AppColors.secondry,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22),
                                ),
                                Icon(
                                  Icons.shopping_cart,
                                  color: AppColors.secondry,
                                )
                              ],
                            )
                          : Container(
                              height: 25,
                              width: 10,
                              child: Center(
                                  child: CircularProgressIndicator(
                                // value: 0.5,
                                color: AppColors.secondry,
                              )),
                            )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
