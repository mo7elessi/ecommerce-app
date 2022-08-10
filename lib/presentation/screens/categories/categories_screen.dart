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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: MySizes.widgetSidePadding,
          right: MySizes.widgetSidePadding,
        ),
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            return ConditionalBuilder(
              condition: state is! CategoriesLoadingState,
              builder: (context) {
                return state is CategoriesLoadedState
                    ? ListView.separated(
                        itemBuilder: (context, index) => CategoryItem(
                          category: state.category,
                          index: index,
                        ),
                        itemCount: state.category.data!.data!.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: MySizes.verticalPadding),
                      )
                    : ErrorMessageWidget(
                        icon: Icons.error,
                        error: state is CategoriesErrorState ? state.error : "",
                      );
              },
              fallback: (context) => const LoadingWidget(),
            );
          },
        ),
      ),
    );
  }
}
