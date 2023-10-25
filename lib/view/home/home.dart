import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:louts_mobile_store/controller/category_controller.dart';
import 'package:louts_mobile_store/controller/product_controller.dart';
import 'package:louts_mobile_store/utils/app_colors.dart';
import 'package:louts_mobile_store/widget/app_bar_widget.dart';
import 'package:louts_mobile_store/widget/carousel_slider_widget.dart';
import 'package:louts_mobile_store/widget/category_listview_widget.dart';
import 'package:louts_mobile_store/widget/section_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenStateState();
}

class _HomeScreenStateState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(),
            CarouselSliderWidget(size: 200, autoplay: true),
            FutureBuilder(
                future: Get.find<CategoryController>().getAllCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.secondry,
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return Text("error");
                  } else {
                    return CategoryListView(
                        categories:
                            Get.find<CategoryController>().allCategoriesList);
                  }
                }),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                GetBuilder<ProductController>(
                    builder: (productController) => Section(
                          title: 'New',
                          items: productController.products,
                        )),
                        GetBuilder<ProductController>(
                    builder: (productController) => Section(
                          title: 'Addiss',
                          items: productController.products,
                        )),
              ]),
            )
          ],
        ),
      ),floatingActionButton: FloatingActionButton(onPressed: () {
setState(() {
          AppColors.primary=Colors.amber;

});      },),
    )
    );
  }
}
