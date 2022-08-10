import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/data/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final int index;

  const CategoryItem({
    Key? key,
    required this.category,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: MyColors.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(MySizes.radius)),
            border: Border.fromBorderSide(
              BorderSide(
                color: MyColors.borderColor,
                width: MySizes.borderWith,
              ),
            )),
        padding: const EdgeInsets.all(MySizes.widgetSidePadding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(category.data!.data![index].name!),
            const Spacer(),
            Image(
              image: NetworkImage(category.data!.data![index].image!),
              width: 80.0,
              height: 80.0,
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
