
import 'package:flutter/material.dart';
import 'package:louts_mobile_store/utils/app_colors.dart';
import 'package:louts_mobile_store/utils/app_dimensions.dart';


class AppBarWidget extends StatelessWidget {
  AppBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height50,
      width: AppDimensions.screenWidth,
      // margin:
      //     EdgeInsets.only(top: AppDimensions.height25, bottom: AppDimensions.height5),
      // padding:
      //     EdgeInsets.only(left: AppDimensions.width10, right: AppDimensions.width10),
     
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                 'Lotus',
                 style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold,fontSize: 22),
              ),
            ),
            Expanded(
              child: InkWell(onTap: () {
                //  Get.toNamed(RouteHelper.getSearchBar();
                 },
                child: Container(
                    margin: EdgeInsets.only(left: 5, top: 5),
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.secondry),
                        borderRadius: BorderRadius.circular(15)),
                    height: AppDimensions.height45,
                    width: double.maxFinite,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 5,
                        ),
                        Text( 'whate are you looking for ?',),
                      ],
                    )),
              ),
            ),
            // Center(
            //   child: Container(
            //     width: Dimensions.width45,
            //     height: Dimensions.height45,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(15),
            //         color: AppColors.third),
            //     child: Icon(
            //       Icons.search,
            //       color: AppColors.primary,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
