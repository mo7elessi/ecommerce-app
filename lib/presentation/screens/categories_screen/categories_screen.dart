import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/logic/category_bloc/category_bloc.dart';
import 'package:bloc_state_managment/logic/connected_bloc/network_bloc.dart';
import 'package:bloc_state_managment/presentation/screens/categories_screen/widgets/category_item.dart';
import 'package:bloc_state_managment/presentation/widgets/error_widget.dart';
import 'package:bloc_state_managment/presentation/widgets/loading_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            left: Sizes.widgetSidePadding, right: Sizes.widgetSidePadding),
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            return ConditionalBuilder(
              condition: state is! CategoriesLoadingState,
              builder: (context) {
                return state is CategoriesLoadedState
                    ? ListView.separated(
                        itemBuilder: (context, index) => CategoryItem(
                          state: state,
                          index: index,
                        ),
                        itemCount: state.category.data!.data!.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: Sizes.verticalPadding),
                      )
                    : ErrorMessageWidget(
                        error:
                            state is CategoriesErrorState ? state.error : "",
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
