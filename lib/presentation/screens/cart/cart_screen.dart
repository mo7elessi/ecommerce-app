import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/presentation/widgets/error_widget.dart';
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
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) => ConditionalBuilder(
            condition: state is! FetchCartLoadingState,
            builder: (context) {
              if (state is FetchCartLoadedState) {
                return state.cart.cartItems!.isNotEmpty
                    ? Container(
                        margin: const EdgeInsets.all(MySizes.widgetSideSpace),
                        child: ListView.separated(
                          itemBuilder: (context, index) => CartItem(
                            state: state,
                            index: index,
                            cartBloc: context.read<CartBloc>(),
                          ),
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: MySizes.verticalSpace,
                            );
                          },
                          itemCount: state.cart.cartItems!.length,
                        ),
                      )
                    : const ErrorMessageWidget(error: "cart is empty");
              }
              return const LoadingWidget();
            },
            fallback: (context) => const LoadingWidget(),
          ),
        ),
      ),
    );
  }
}
