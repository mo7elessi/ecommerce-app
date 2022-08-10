import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class WrapperWidget extends StatelessWidget {
  final String title;
  final Widget body;

  const WrapperWidget({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(MySizes.widgetSidePadding),
        child: body,
      ),
    );
  }
}
