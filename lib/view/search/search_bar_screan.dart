import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:louts_mobile_store/routes/route_app.dart';

import '../../controller/product_controller.dart';
import '../../utils/app_colors.dart';

class SearchBarScrean extends StatefulWidget {
  const SearchBarScrean({super.key});

  @override
  State<SearchBarScrean> createState() => _SearchBarScreanState();
}

class _SearchBarScreanState extends State<SearchBarScrean> {
  TextEditingController _searchFilde = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin:
                      EdgeInsets.only(top: 5, right: 10, left: 5, bottom: 5),
                  child:

                      ///start search field input
                      TextFormField(
                    controller: _searchFilde,
                    autofocus: true,
                    cursorColor: AppColors.primary,
                    onChanged: (value) {
                      setState(() {
                        Get.find<ProductController>()
                            .getSearchTitle(_searchFilde.text.toString());
                      });
                    },
                    style: TextStyle(
                        height: 1,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: AppColors.primary),
                      hintText: 'What are you looking for?',

                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.primary, width: 2)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.grey,
                          width: 2.0,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: AppColors.primary,
                        ),
                        onPressed: () => _searchFilde.clear(),
                      ),
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                        color: AppColors.primary,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                      // contentPadding: EdgeInsets.all(5),
                      hintStyle: TextStyle(
                          height: 1,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          FutureBuilder(
              future: Get.find<ProductController>()
                  .getSearchTitle(_searchFilde.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircleAvatar(),
                  );
                }
                if (snapshot.hasError) {
                  return Text("error");
                } else {
                  print("snapshot");

                  return Expanded(
                      child: Container(
                    child: ListView.builder(
                      itemCount:
                          Get.find<ProductController>().searchTitlesResults.length,
                      itemBuilder: (context, index) => searchTitleResult(
                          Get.find<ProductController>()
                              .searchTitlesResults[index]
                              .name!),
                    ),
                  ));
                }
              })
        ]),
      ),
    );
  }

  Widget searchTitleResult(String title) {
    return TextButton(
      onPressed:() =>  Get.find<ProductController>().getSearchProductResults(title).then((value) => Get.toNamed(RouteApp.getSearchResult())),
      child: Container(
        child: Column(
          children: [
            Row(children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      color: AppColors.primary ,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primary,
                ),
              )
            ]),
            Divider()
          ],
        ),
      ),
    );
  }
}
