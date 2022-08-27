import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/presentation/widgets/error_widget.dart';
import 'package:bloc_state_managment/presentation/widgets/loading_widget.dart';
import 'package:bloc_state_managment/presentation/widgets/product_item_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/favorite_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) => ConditionalBuilder(
            condition: state is! FetchFavoriteLoadingState,
            builder: (context) {
              if (state is FetchFavoriteLoadedState) {
                return state.favorite.isNotEmpty
                    ? Container(
                        margin: const EdgeInsets.all(MySizes.widgetSideSpace),
                        child:GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                          childAspectRatio: 1 / 1.3,
                          children: List.generate(
                              state.favorite.length, (index) {
                            return ProductItemWidget(
                              product: state.favorite[index].product!,
                            );
                          }),
                        ),
                      )
                    : const ErrorMessageWidget(error: "favorite is empty");
              }
              return const LoadingWidget();
            },
            fallback: (context) => const LoadingWidget(),
          ),
        );
  }
}
