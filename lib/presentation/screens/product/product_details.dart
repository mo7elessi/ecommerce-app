import 'package:bloc_state_managment/data/model/product_model.dart';
import 'package:bloc_state_managment/presentation/screens/product/widgets/product_images_widget.dart';
import 'package:bloc_state_managment/presentation/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/themes/app_theme.dart';
import '../../widgets/secondary_button_widget.dart';
import '../cart/bloc/bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImagesWidget(product: product),
                  const SizedBox(height: MySizes.verticalSpace),
                  Container(
                    margin: const EdgeInsets.all(MySizes.widgetSideSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${product.price.round()} EGP',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: MyColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(width: MySizes.horizontalSpace),
                            if (product.discount > 0)
                              Text(
                                '${product.oldPrice.round()} EGP',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                              ),
                          ],
                        ),
                        const SizedBox(height: MySizes.verticalSpace),
                        Text(
                          product.name!,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: MySizes.verticalSpace * 3),
                        Row(
                          children: [
                            const Text(
                              'QUANTITY',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                            ),
                            const SizedBox(width: MySizes.horizontalSpace),
                            Text("1",
                                style: Theme.of(context).textTheme.bodyText1),
                            const SizedBox(width: MySizes.horizontalSpace),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                        const SizedBox(height: MySizes.verticalSpace),
                        const Text(
                          'MORE DETAILS',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: MySizes.verticalSpace / 2),
                        Text(
                          product.description ?? "No description",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(MySizes.widgetSideSpace),
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return product.inCart!
                        ? SecondaryButtonWidget(
                            function: () {
                              return context.read<CartBloc>().add(
                                    AddOrRemoveProductFromCartEvent(
                                      product.id,
                                    ),
                                  );
                            },
                            text: "remove",
                          )
                        : PrimaryButtonWidget(
                            function: () {
                              return context.read<CartBloc>().add(
                                    AddOrRemoveProductFromCartEvent(
                                      product.id,
                                    ),
                                  );
                            },
                            text: "cart",
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
