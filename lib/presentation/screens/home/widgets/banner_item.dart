import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../data/model/home_model.dart';

class BannerItemWidget extends StatelessWidget {
  final HomeModel model;

  const BannerItemWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1.0,
        initialPage: 0,
        autoPlay: true,
        reverse: false,
        enableInfiniteScroll: true,
        autoPlayCurve: Curves.decelerate,
        scrollDirection: Axis.horizontal,
        autoPlayAnimationDuration: const Duration(seconds: 5),
      ),
      items: model.data!.banners!.map((e) {
        return Image(
          fit: BoxFit.cover,
          image: NetworkImage(e.image!),
        );
      }).toList(),
    );
  }
}
