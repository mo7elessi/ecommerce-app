import 'package:bloc_state_managment/presentation/widgets/error_widget.dart';
import 'package:bloc_state_managment/presentation/widgets/list_view_widget.dart';
import 'package:bloc_state_managment/presentation/widgets/loading_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/cart_bloc.dart';
import 'widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) => ConditionalBuilder(
        condition: state is! FetchCartLoadingState,
        builder: (context) {
          if (state is FetchCartLoadedState) {
            return state.cart.cartItems!.isNotEmpty
                ? ListViewWidget(
                    builder: (context, index) => CartItem(
                      state: state,
                      index: index,
                    ),
                    length: state.cart.cartItems!.length,
                  )
                : const ErrorMessageWidget(error: "cart is empty");
          }
          return const LoadingWidget();
        },
        fallback: (context) => const LoadingWidget(),
      ),
    );
  }
}
