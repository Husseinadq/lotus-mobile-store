import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:louts_mobile_store/model/photo.dart';

// ignore: must_be_immutable
class CarouselSliderWidget extends StatelessWidget {
    CarouselController buttonCarouselController = CarouselController();
  int _current = 0;

  CarouselSliderWidget(
      {super.key,
      required this.size,
      required this.autoplay,
       this.photos});

  double size;
  bool autoplay;
  List<Photo>? photos;

  List<String> urls = [
    'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
    'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
    'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
    'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'
  ];

  List<Widget> stringsToWidgets(List<String>? ImagesUrls) {
    List<Widget> images = [];
    for (var item in ImagesUrls!) {
      images.add(Image.network(
        item,
        fit: BoxFit.fill,
      ));
    }
    return images;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: size,
      child: Column(
        children: [
          CarouselSlider(
            carouselController: buttonCarouselController,
            items: stringsToWidgets(urls),
            options: CarouselOptions(
              autoPlay: autoplay,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 2,
            ),
          ),
          // Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // children: urls.asMap().entries.map((entry) {
          //   return GestureDetector(
          //     onTap: () => buttonCarouselController.animateToPage(entry.key),
          //     child: Container(
          //       width: 6.0,
          //       height: 6.0,
          //       margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: (Theme.of(context).brightness == Brightness.dark
          //                   ? Colors.white
          //                   : Colors.black)
          //               .withOpacity(_current == entry.key ? 0.9 : 0.4)),
          //     ),
          //   );
          // }).toList(),)
        ],
      ),
    );
  }
}
