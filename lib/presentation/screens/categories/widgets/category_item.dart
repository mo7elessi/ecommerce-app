import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/core/util/my_box_decoration.dart';
import 'package:bloc_state_managment/data/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final int index;
  final Function onTapProduct;

  const CategoryItem({
    Key? key,
    required this.category,
    required this.index,
    required this.onTapProduct,
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
              category.data!.data![index].name!,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(),
            ),
            const Spacer(),
            Image(
              image: NetworkImage(category.data!.data![index].image!),
              width: MySizes.productImageWidth/2,
              height: MySizes.productImageHeight/2,
            ),
          ],
        ),
      ),
      onTap: () =>onTapProduct(),
    );
  }
}
