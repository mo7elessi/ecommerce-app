import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/data/model/product_model.dart';
import 'package:bloc_state_managment/presentation/screens/home/widgets/banner_item.dart';
import 'package:bloc_state_managment/presentation/widgets/text_field_widget.dart';
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
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(MySizes.widgetSideSpace),
                    child: TextFieldWidget(
                      controller: searchController,
                      keyboard: TextInputType.name,
                      prefixIcon: Icons.search,
                      validator: () {},
                      onChanged: (value) {
                        context.read<ProductBloc>().add(
                              SearchEvent(
                                searchController.text,
                              ),
                            );
                      },
                      hint: 'search..',
                    ),
                  ),
                  if (state is SearchLoadedState)
                    for (Product data in state.products)
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BannerItemWidget(model: state.homeModel),
                    Container(
                      margin: const EdgeInsets.all(MySizes.widgetSideSpace/2),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Features Products",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "SEE ALL",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 4.0,
                            crossAxisSpacing: 4.0,
                            childAspectRatio: 1 / 1.3,
                            children: List.generate(
                                state.homeModel.data!.products!.length, (index) {
                              return ProductItemWidget(
                                product: state.homeModel.data!.products![index],
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const LoadingWidget();
            },
          ),
        ],
      ),
    );
  }
}
