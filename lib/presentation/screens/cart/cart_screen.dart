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
        body: Padding(
          padding: const EdgeInsets.only(
            left: MySizes.widgetSidePadding,
            right: MySizes.widgetSidePadding,
          ),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) => ConditionalBuilder(
              condition: state is! FetchCartLoadingState,
              builder: (context) {
                if (state is FetchCartLoadedState) {
                  return state.cartModel.data!.cartItems!.isNotEmpty
                      ? ListView.separated(
                          itemBuilder: (context, index) => CartItem(
                            state: state,
                            index: index,
                          ),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(height: MySizes.verticalPadding),
                          itemCount: state.cartModel.data!.cartItems!.length,
                        )
                      : const ErrorMessageWidget(
                          error: "cart is empty",
                          icon: Icons.remove_shopping_cart,
                        );
                }else if (state is FetchCartErrorState) {
                  return ErrorMessageWidget(
                    error: state.error,
                    icon: Icons.error,
                  );
                } else {
                  return const ErrorMessageWidget(
                    error: 'Please check internet connection',
                    icon: Icons.wifi_off_sharp,
                  );
                }
              },
              fallback: (context) => const LoadingWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
