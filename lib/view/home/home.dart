import 'package:flutter/material.dart';
import 'package:louts_mobile_store/widget/app_bar_widget.dart';
import 'package:louts_mobile_store/widget/carousel_slider_widget.dart';
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
            SingleChildScrollView(
              scrollDirection: Axis.vertical,child: Column(children: [
              Section(title: 'New',)
              ]),)
          ],
        ),
      ),
    ));
  }
}
