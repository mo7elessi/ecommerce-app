import 'package:bloc_state_managment/presentation/widgets/primary_button_widget.dart';
import 'package:bloc_state_managment/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../product/bloc/product_bloc.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return Column(
              children: [
                TextFieldWidget(
                  controller: searchController,
                  keyboard: TextInputType.name,
                  validator: () {},
                  hint: 'Search about products..',
                ),
                PrimaryButtonWidget(
                    function: () => context
                        .read<ProductBloc>()
                        .add(SearchEvent(searchController.text)),
                    text: "search"),
                if (state is SearchLoadedState)
                  if (state.productResponse.status == true)
                    state.productResponse.data!.data!.isNotEmpty
                        ? Text(state.productResponse.data!.data!.first.name
                            .toString())
                        : Text('${searchController.text} not fount'),
                if (state is SearchErrorState) Text(state.error),
              ],
            );
          },
        ),
      ),
    );
  }
}
// BlocBuilder<HomeBloc, HomeState>(
//   builder: (context, state) {
//     return Column(
//       children: [
//         if (state is FetchHomeDataLoadingState)
//           const LoadingWidget(),
//         if (state is FetchHomeDataLoadedState)
//           ListView.separated(
//             shrinkWrap: true,
//             itemBuilder: (context, index) => ListTile(
//               title: Text(state
//                   .homeModel.data!.products![index].name
//                   .toString()),
//             ),
//             separatorBuilder: (context, index) =>
//                 const SizedBox(height: Sizes.verticalPadding),
//             itemCount: state.homeModel.data!.products!.length,
//           ),
//         if (state is FetchHomeDataErrorState)
//           Center(
//               child: ErrorMessageWidget(
//             error: state.error,
//             icon: Icons.error,
//           )),
//       ],
//     );
//   },
// ),
