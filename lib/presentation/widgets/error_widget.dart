import 'package:flutter/material.dart';
import 'package:bloc_state_managment/core/themes/app_theme.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String error;
  final IconData? icon;

  const ErrorMessageWidget({
    Key? key,
    required this.error,
     this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.backgroundColor,
      padding: const EdgeInsets.all(MySizes.widgetSidePadding),
      child: Text(error),
    );
  }
}
