import 'package:bloc_state_managment/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/themes/app_theme.dart';
import '../../../../core/util/my_box_decoration.dart';

class ProductImagesWidget extends StatelessWidget {
  final ProductModel product;

  const ProductImagesWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController productImages = PageController();
    return Container(
      height: 300.0,
      decoration: myBoxDecoration,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Padding(
            padding: const EdgeInsets.all(MySizes.widgetSideSpace),
            child: PageView.builder(
              controller: productImages,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Image(
                image: NetworkImage(product.images![index]),
              ),
              itemCount: product.images!.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(MySizes.widgetSideSpace),
            child: SmoothPageIndicator(
              controller: productImages,
              count: product.images!.length,
              effect: const ExpandingDotsEffect(
                dotColor: Color(0xffeaeaea),
                activeDotColor: MyColors.primaryColor,
                expansionFactor: 2,
                dotHeight: 8,
                dotWidth: 12,
                spacing: 5,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(
                Icons.bookmark_border,
                size: 32.0,
                color: MyColors.primaryColor,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
