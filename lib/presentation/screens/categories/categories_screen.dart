import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/presentation/widgets/error_widget.dart';
import 'package:bloc_state_managment/presentation/widgets/loading_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc//bloc.dart';
import 'widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! CategoriesLoadingState,
          builder: (context) {
            if (state is CategoriesLoadedState) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return CategoryItem(
                    category: state.category,
                    index: index,
                  );
                },
                itemCount: state.category.data!.data!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: MySizes.verticalPadding);
                },
              );
            }
            return const LoadingWidget();
          },
          fallback: (context) => const LoadingWidget(),
        );
      },
    );
  }
}
