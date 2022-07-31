import 'package:flutter/material.dart';
import 'package:bloc_state_managment/core/themes/app_theme.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String error;

  const ErrorMessageWidget({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.wifi_off_sharp,color: Colors.red),
          const SizedBox(height: Sizes.verticalPadding),
          Text(error),
        ],
      ),
      backgroundColor: MyColors.backgroundColor,
      padding: const EdgeInsets.all(Sizes.widgetSidePadding),
    );
  }

}
