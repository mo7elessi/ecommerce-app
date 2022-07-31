import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/data/model/category_model/category_model.dart';
import 'package:bloc_state_managment/logic/category_bloc/category_bloc.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final CategoriesLoadedState state;
  final int index;

  const CategoryItem({
    Key? key,
    required this.state,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Data data = state.category.data!.data![index];
    return GestureDetector(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: MyColors.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(Sizes.radius)),
            border: Border.fromBorderSide(
              BorderSide(
                color: MyColors.borderColor,
                width: Sizes.borderWith,
              ),
            )),
        padding: const EdgeInsets.all(Sizes.widgetSidePadding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(data.name!),
            const Spacer(),
            Image(
              image: NetworkImage(data.image!),
              width: 50.0,
              height: 50.0,
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
