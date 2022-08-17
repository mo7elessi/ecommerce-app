import 'package:flutter/material.dart';

import '../../core/themes/app_theme.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(MySizes.radius),
          ),
          color: MyColors.primaryColor,
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'DISCOUNT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
