import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class SellerCard extends StatelessWidget {
  const SellerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      child: Column(children: [
        Row(
          children: [
            Container(
              child: CircleAvatar(
                backgroundColor: AppColors.grey,
                radius: 25,
                child: Image.asset("assets/images/p2.png"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Sold by ",
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    Text(
                      'Hussein',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(top: 2, bottom: 2, left: 5, right: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.primary),
                      child: Row(
                        children: [
                          Text(
                            "4.3",
                            style: TextStyle(
                                color: AppColors.secondry,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            size: 15,
                            color: AppColors.secondry,
                          )
                        ],
                      ),
                    ),
                    // Text("Seller Ratin")
                  ],
                )
              ],
            ),
            // Icon(Icons.arrow_forward_ios)
          ],
        ),
        // Divider(),
      ]),
    );
  }
}
