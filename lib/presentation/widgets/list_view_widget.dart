import 'package:flutter/material.dart';

import '../../core/themes/app_theme.dart';

typedef IndexedWidgetBuilder = Widget Function(BuildContext context, int index);

class ListViewWidget extends StatelessWidget {
  final IndexedWidgetBuilder builder;
  final int length;

  const ListViewWidget({
    Key? key,
    required this.builder,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(MySizes.widgetSideSpace),
      child: ListView.separated(
        itemBuilder: (context, index) => builder(context, index),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: MySizes.verticalSpace,
          );
        },
        itemCount: length,
      ),
    );
  }
}
