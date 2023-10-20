import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/product_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_dimensions.dart';
import '../product/product_card_widget.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.find<ProductController>().getAllProducts();
    return Scaffold(
        body: Container(
          height: AppDimensions.screenHeight,
          child: Column(
            children: [
              Container(
                height: AppDimensions.height100,
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: IconButton(
                                onPressed: () => Get.back(),
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "LOTUS",
                                style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25),
                              ),
                            )
                          ],
                        )),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: AppDimensions.screenWidth,
                        color: AppColors.grey,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                // width: double.maxFinite,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.secondry),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.search),
                                    ),
                                    Expanded(child: SizedBox())
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: AppDimensions.screenHeight - AppDimensions.height100,
                  width: AppDimensions.screenWidth,
                  child: Column(
                    children: [
                      Container(
                          height: AppDimensions.height60,
                          color: AppColors.secondry,
                          child: ListView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.grey,
                                  ),
                                  height: AppDimensions.height45,
                                  // width: AppDimensions.width100,
                                  margin: EdgeInsets.only(
                                      top: 10, left: 10, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          "Price",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child:
                                              Icon(Icons.keyboard_arrow_down))
                                    ],
                                  ),
                                )),
                          )),
                      Divider(),
                      Expanded(
                        child: Container(
                          color: AppColors.secondry,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20,
                                      childAspectRatio: 3 / 6),
                              itemCount: Get.find<ProductController>()
                                  .searchProductResults
                                  .length,
                              itemBuilder: (context, index) =>
                                  // SearchProductCard(),
                                  ProductCard(
                                      product: Get.find<ProductController>()
                                          .searchProductResults[index])),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          width: 200,
          height: 35,
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Text(
                        "Sort",
                        style: TextStyle(
                            color: AppColors.secondry,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.swap_vert,
                        color: AppColors.secondry,
                      )
                    ],
                  ),
                ),
                VerticalDivider(color: AppColors.secondry),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Filter",
                        style: TextStyle(
                            color: AppColors.secondry,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.filter_alt,
                        color: AppColors.secondry,
                        size: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
