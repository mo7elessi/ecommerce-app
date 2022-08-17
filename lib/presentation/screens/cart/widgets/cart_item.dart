import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/cart_model.dart';
import '../../../widgets/discount_widget.dart';
import '../bloc/cart_bloc.dart';

class CartItem extends StatelessWidget {
  final FetchCartLoadedState state;
  final CartBloc cartBloc;
  final int index;

  const CartItem({
    Key? key,
    required this.state,
    required this.index,
    required this.cartBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartItems cartItem = state.cart.cartItems![index];
    dynamic price = cartItem.product!.price;
    dynamic quantity = cartItem.quantity;
    String? image = cartItem.product!.image;
    String? name = cartItem.product!.name;
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: MyColors.backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(MySizes.radius)),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: MyColors.borderColor,
                    width: MySizes.borderWidth,
                  ),
                )),
            padding: const EdgeInsets.all(MySizes.widgetSideSpace),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image(
                    image: NetworkImage("$image"),
                    width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(width: MySizes.horizontalSpace),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "$name",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: MySizes.verticalSpace),
                      Text(
                        "$price EGP",
                        style: Theme.of(context).textTheme.bodySmall!,
                      ),
                      const SizedBox(height: MySizes.verticalSpace),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(Icons.add),
                          ),
                          const SizedBox(width: MySizes.horizontalSpace),
                          Text("$quantity"),
                          const SizedBox(width: MySizes.horizontalSpace),
                          InkWell(
                            onTap: () {},
                            child: const Icon(Icons.remove),
                          ),
                          const Spacer(),
                          Text(
                            "T: ${(price) * (quantity)} EGP",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: MyColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (state.cart.cartItems![index].product!.discount > 0)
            const DiscountWidget(),
        ],
      ),
      onTap: () {},
    );
  }
}
