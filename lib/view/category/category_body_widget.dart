// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louts_mobile_store/utils/app_colors.dart';
import 'package:louts_mobile_store/utils/app_dimensions.dart';

import '../../controller/category_controller.dart';

class CategoryBodyWidget extends StatefulWidget {
  const CategoryBodyWidget({super.key});

  @override
  State<CategoryBodyWidget> createState() => _CategoryBodyWidget();
}

class _CategoryBodyWidget extends State<CategoryBodyWidget> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    Get.find<CategoryController>().getAllCategories();

    return Row(
      children: [
        Expanded(
            flex: 1,
            child: GetBuilder<CategoryController>(
              builder: (categoryController) => ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: categoryController.allCategoriesList.length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() async {
                            selected = index;
                            await categoryController.getSubCategories(
                                categoryController
                                    .allCategoriesList[index].id!);
                          });
                        },
                        child: MainCategoriesCard(
                            categoryController.allCategoriesList[index].name!,
                            (selected == index ? true : false)),
                      )),
            )),
        Expanded(
            flex: 3,
            child: SizedBox(
              height: AppDimensions.height130,
              child: GetBuilder<CategoryController>(
                builder: (categoryController) =>
                    ListView(scrollDirection: Axis.vertical, children: [
                  ExpansionTileCard(
                    items: categoryController.subCategories,
                    title: categoryController.allCategoriesList[selected].name!,
                  ),
                  ExpansionTileCard(
                    items: categoryController.allCategoriesList,
                    title: 'Top Brands',
                  ),
                ]),
              ),
            ))
      ],
    );
  }
}

Widget MainCategoriesCard(String title, bool isSelected) {
  return Container(
    height: AppDimensions.height60,
    decoration: BoxDecoration(
      color: isSelected == true ? AppColors.primary : AppColors.lightgrey,
    ),
    child: Row(
      children: [
        isSelected == true
            ? Container(
                height: double.maxFinite,
                width: 4,
                color: AppColors.secondryAccent,
              )
            : SizedBox(
                width: 0,
                height: 0,
              ),
        Expanded(
          child: Center(
              child: Padding(
            padding: EdgeInsets.all(AppDimensions.height10),
            child: Text(
              title,
              maxLines: 2,
              softWrap: true,
            ),
          )),
        ),
      ],
    ),
  );
}

class ExpansionTileCard extends StatelessWidget {
  String title;
  List<dynamic> items;
  ExpansionTileCard({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      onExpansionChanged: (value) {},
      controlAffinity: ListTileControlAffinity.trailing,
      children: [
        SizedBox(
          height: AppDimensions.height200,
          width: double.maxFinite,
          child: GridView.builder(
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
            itemBuilder: (context, index) =>
                subCategoriesCard(items[index].name!, "assets/images/2.png"),
          ),
        ),
      ],
    );
  }

  Widget subCategoriesCard(String title, String image) {
    return Card(
      elevation: 1,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppDimensions.size20)),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.only(top: AppDimensions.height5),
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppDimensions.size20)),
                width: double.maxFinite,
                child: Center(child: Image.asset(image, fit: BoxFit.fill)),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(top: AppDimensions.height5),
                child: Text(
                  title,
                  maxLines: 2,
                  softWrap: false,
                  style: TextStyle(fontSize: AppDimensions.size13),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
