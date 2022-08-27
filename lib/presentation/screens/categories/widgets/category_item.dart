import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/core/util/my_box_decoration.dart';
import 'package:bloc_state_managment/data/model/category_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/routes.dart';

class CategoryItemWidget extends StatelessWidget {
  final List<CategoryModel> category;
  final int index;

  const CategoryItemWidget({
    Key? key,
    required this.category,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        decoration: myBoxDecoration,
        padding: const EdgeInsets.all(MySizes.widgetSideSpace),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              category[index].name ?? "No title",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(),
            ),
            const Spacer(),
            Image(
              image: NetworkImage(category[index].image ?? ""),
              width: MySizes.productImageWidth / 2,
              height: MySizes.productImageHeight / 2,
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.productsByCategoryScreen,
          arguments: category[index],
        );
      },
    );
  }
}
