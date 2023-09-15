// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:louts_mobile_store/view/category/category_body_widget.dart';
import 'package:louts_mobile_store/widget/app_bar_widget.dart';




class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [AppBarWidget(), Expanded(child: CategoryBodyWidget())],
      ),
    );
  }
}
