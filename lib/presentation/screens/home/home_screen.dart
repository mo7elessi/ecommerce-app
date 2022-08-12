import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/data/model/product_model.dart';
import 'package:bloc_state_managment/presentation/screens/home/widgets/banner_item.dart';
import 'package:bloc_state_managment/presentation/widgets/primary_button_widget.dart';
import 'package:bloc_state_managment/presentation/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/loading_widget.dart';
import '../../widgets/product_item_widget.dart';
import '../product/bloc/product_bloc.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(MySizes.widgetSidePadding),
        child: Column(
          children: [
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return Column(
                  children: [
                    TextFieldWidget(
                      controller: searchController,
                      keyboard: TextInputType.name,
                      validator: () {},
                      onChanged: (value) {
                        context.read<ProductBloc>().add(
                              SearchEvent(searchController.text),
                            );
                      },
                      hint: 'search..',
                    ),

                    const SizedBox(height: MySizes.verticalPadding),
                    if (state is SearchLoadedState)
                      for (ProductModel data in state.products)
                        Text(
                          state.products.isNotEmpty
                              ? "${data.name}"
                              : "No product yet!",
                        )
                  ],
                );
              },
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is FetchHomeDataLoadingState) {
                  return const LoadingWidget();
                } else if (state is FetchHomeDataLoadedState) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BannerItemWidget(model: state.homeModel),
                      const SizedBox(height: MySizes.verticalPadding),
                      ListView.separated(
                        itemBuilder: (context, index) {
                          return ProductItemWidget(
                            product: state.homeModel.data!.products![index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                              height: MySizes.verticalPadding);
                        },
                        itemCount: state.homeModel.data!.products!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                    ],
                  );
                }
                return const LoadingWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}
