import 'package:bloc_state_managment/data/model/category_model.dart';
import 'package:bloc_state_managment/data/repositories/category_repository.dart';
import 'package:bloc_state_managment/presentation/widgets/loading_widget.dart';
import 'package:bloc_state_managment/presentation/widgets/product_item_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/themes/app_theme.dart';
import 'bloc/category_bloc.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  final CategoryModel categoryItem;

  const ProductsByCategoryScreen({
    Key? key,
    required this.categoryItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryItem.name ?? "No title"),
      ),
      body: Builder(builder: (context) {
        CategoryBloc bloc = CategoryBloc(
          categoryRepository: CategoryRepositoryImpl(),
        );
        bloc.add(FetchProductsByCategoryEvent(categoryId: categoryItem.id!));
        return BlocBuilder<CategoryBloc, CategoryState>(
          bloc: bloc,
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
        );
      }),
    );
  }
}
