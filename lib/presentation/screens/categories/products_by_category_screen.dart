import 'package:bloc_state_managment/presentation/widgets/loading_widget.dart';
import 'package:bloc_state_managment/presentation/widgets/product_item_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/themes/app_theme.dart';
import 'bloc/category_bloc.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  const ProductsByCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! ProductsByCategoryLoadingState,
            builder: (context) {
              if (state is ProductsByCategoryLoadedState) {
                return Container(
                  margin: const EdgeInsets.all(MySizes.widgetSideSpace / 2),
                  child: GridView.count(
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    childAspectRatio: 1 / 1.3,
                    children: List.generate(state.product.length, (index) {
                      return ProductItemWidget(
                        product: state.product[index],
                      );
                    }),
                  ),
                );
              } else {
                return const LoadingWidget();
              }
            },
            fallback: (context) => const LoadingWidget(),
          );
        },
      ),
    );
  }
}
