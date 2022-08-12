import 'package:bloc_state_managment/data/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../core/themes/app_theme.dart';
import 'discount_widget.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel product;

  const ProductItemWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(MySizes.radius)),
            color: MyColors.backgroundColor,
            border: Border.fromBorderSide(BorderSide(
              width: MySizes.borderWith,
              color: MyColors.borderColor,
            ))),
        padding: const EdgeInsets.all(MySizes.widgetSidePadding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image(
                  image: NetworkImage(product.image!),
                  width: MySizes.productImageWidth,
                  height: MySizes.productImageHeight,
                ),
                if (product.discount > 0) const DiscountWidget(),
              ],
            ),
            const SizedBox(height: MySizes.verticalPadding),
            Text(product.name!),
            Row(
              children: [
                Text('${product.price.round()} EGP'),
                const SizedBox(width: MySizes.horizontalPadding),
                if (product.discount > 0)
                  Text(
                    '${product.oldPrice.round()} EGP',
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
