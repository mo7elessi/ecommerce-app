import 'package:bloc_state_managment/core/util/my_box_decoration.dart';
import 'package:bloc_state_managment/data/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../core/routes/routes.dart';
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
      child: Stack(
        children: [
          Container(
            decoration: myBoxDecoration,
            padding: const EdgeInsets.all(MySizes.widgetSideSpace / 1.25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image(
                    image: NetworkImage(product.image!),
                    height: MySizes.productImageHeight,
                  ),
                ),
                const SizedBox(height: MySizes.verticalSpace),
                Text(
                  product.name!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('${product.price.round()} EGP',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: MyColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                )),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: const Icon(Icons.bookmark_border),
                        ),
                      ],
                    ),
                    if (product.discount > 0)
                      Text(
                        '${product.oldPrice.round()} EGP',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 10,
                            ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (product.discount > 0) const DiscountWidget(),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.productDetailsScreen,
          arguments: product,
        );
      },
    );
  }
}
