// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';


class ProductDetailCard extends StatefulWidget {
  final String overview;

  ProductDetailCard({
    Key? key,
    required this.overview,
  }) : super(key: key);

  @override
  State<ProductDetailCard> createState() => _ProductDetailCardState();
}

class _ProductDetailCardState extends State<ProductDetailCard> {
  bool _isOverviewShow = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () {
                setState(() {
                  _isOverviewShow = true;
                });
              },
              child: Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  // padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "Overview",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        height: 4,
                        color: _isOverviewShow
                            ? AppColors.primary
                            : AppColors.grey,
                      )
                    ],
                  )),
            )),
            Expanded(
                child: InkWell(
              onTap: () {
                setState(() {
                  _isOverviewShow = false;
                });
              },
              child: Container(
                  child: Column(
                children: [
                  Text(
                    "Specifications",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                  Container(
                    height: 4,
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    color:
                        !_isOverviewShow ? AppColors.primary : AppColors.grey,
                  )
                ],
              )),
            )),
          ],
        ),
        Container(
            height: 180,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            child: _isOverviewShow
                ? Text(
                    "${widget.overview}",
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.left,
                    // locale: Locale(_languageCode),
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  )
                : Container(
                    // height: 200,
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Specifications",
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: ListView.builder(
                                // physics: NeverScrollableScrollPhysics(),
                                itemCount: 5,
                                itemBuilder: ((context, index) => Container(
                                      color: index % 2 == 0
                                          ? AppColors.grey
                                          : AppColors.secondry,
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 5,
                                          bottom: 5),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text("Colours Name"),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text("Clear"),
                                          )
                                        ],
                                      ),
                                    ))),
                          ))
                        ],
                      ),
                    ),
                  ))
      ]),
    );
  }
}
