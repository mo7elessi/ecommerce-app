import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

import '../bloc/cart_bloc.dart';


class CartItem extends StatelessWidget {
  final FetchCartLoadedState state;
  final int index;

  const CartItem({
    Key? key,
    required this.state,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: MyColors.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(MySizes.radius)),
            border: Border.fromBorderSide(
              BorderSide(
                color: MyColors.borderColor,
                width: MySizes.borderWith,
              ),
            )),
        padding: const EdgeInsets.all(MySizes.widgetSidePadding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(
                  "${state.cartModel.data!.cartItems![index].product!.image}"),
              width: 80.0,
              height: 80.0,
            ),
            const SizedBox(height: MySizes.verticalPadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${state.cartModel.data!.cartItems![index].quantity}",
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("increment"),
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
