import 'package:flutter/material.dart';

import '../../../../core/themes/app_theme.dart';

class ChangeQuantityWidget extends StatelessWidget {
  const ChangeQuantityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'QUANTITY',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
        const SizedBox(width: MySizes.horizontalSpace),
        Text("1", style: Theme.of(context).textTheme.bodyText1),
        const SizedBox(width: MySizes.horizontalSpace),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
