import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louts_mobile_store/utils/app_colors.dart';
import 'package:louts_mobile_store/utils/app_dimensions.dart';
import 'package:louts_mobile_store/view/product/product_card_widget.dart';


class Section extends StatelessWidget {
  String title;
  // List<Product> items;
  Section({super.key, required this.title 
  // ,required this.items
  } );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height350,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(
                left: 10,
              ),
              height: AppDimensions.height50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: AppDimensions.size20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: AppDimensions.height30,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.secondry)),
                    child: Text('Show All'),
                  )
                ],
              )),
          Container(
            height: AppDimensions.height300,
            child: ListView.builder(
                  itemCount:6
                  //  items.length
                   ,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return ProductCard(
                        // product: items[index],
                      );
                    }))),

        ],
      ),
    );
  }
}
