import 'package:flutter/material.dart';

import '../../core/themes/app_theme.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final double? width;
  final Color? background;
  final Function function;
  final String text;

  const SecondaryButtonWidget({
    Key? key,
    this.width = double.infinity,
    this.background = MyColors.primaryColor,
    required this.function,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: MyColors.scaffoldBackgroundColor,
      height: MySizes.buttonHeight,
      child: OutlinedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(),
          ),
        ),
        onPressed: () => function(),
        child: Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.button!.copyWith(
                fontWeight: FontWeight.bold,
                color: MyColors.primaryColor,
              ),
        ),
      ),
    );
  }
}
