// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louts_mobile_store/controller/category_controller.dart';
import 'package:louts_mobile_store/controller/product_controller.dart';
import 'package:louts_mobile_store/model/category_model.dart';
import 'package:louts_mobile_store/routes/route_app.dart';
import 'package:louts_mobile_store/utils/app_colors.dart';
import 'package:louts_mobile_store/utils/app_dimensions.dart';
import 'package:scroll_indicator/scroll_indicator.dart';

import '../controller/popular_product_controller.dart';

class CategoryListView extends StatefulWidget {
  List<Category>? categories;
  bool? isSubHome = false;

  CategoryListView({Key? key, this.categories, this.isSubHome})
      : super(key: key);

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  ScrollController scrollController = ScrollController();
  double pixels = 0.0;

  @override
  void initState() {
    scrollController = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.find<CategoryController>().getAllCategories();
    return Container(
        height: AppDimensions.height200,
        width: double.maxFinite,
        color: AppColors.secondry,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              height: AppDimensions.height180,
              child: GetBuilder<CategoryController>(
                builder: (categoriesController) => GridView.builder(
                    controller: scrollController,
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0),
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.categories!.length,
                    // categoriesController.allCategoriesList.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          // AppConstants.CategorySelected =
                          //     widget.categories![index].id!;

                          if (widget.isSubHome == true) {
                            Get.find<ProductController>()
                                .getProductsFromCategory(
                                    widget.categories![index].id!)
                                .then((value) =>
                                    Get.toNamed(RouteApp.getSearchResult()));
                          } else {
                            Get.toNamed(RouteApp.getSubHome(), arguments: {
                              'categoryId': widget.categories![index].id!
                            });
                          }
                        },
                        // onTap: () => Get.find<CategoryController>()
                        //     .getSubCategories(widget.categories![index].id!)
                        //     .then((value) {
                        //   print(
                        //       "value = $value OF INDEX ${Get.find<CategoryController>().subCategories[0].name}");
                        //   if (value == true) {
                        //     Get.toNamed(RouteHelper.getSubHome());
                        //   }
                        // }),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 1, top: 0),
                          height: AppDimensions.height90,
                          // width: Dimensions.height5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: CircleAvatar(
                                  radius: AppDimensions.size35,
                                  backgroundColor: AppColors.grey,
                                  child: Image.network(
                                      widget.categories![index].image!),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "${widget.categories![index].name}",
                                  // categoriesController
                                  //     .allCategoriesList[index].name!,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5),
              child: ScrollIndicator(
                scrollController: scrollController,
                width: AppDimensions.width40,
                height: 5,
                indicatorWidth: AppDimensions.width20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.lightgrey),
                indicatorDecoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ));
  }
}
