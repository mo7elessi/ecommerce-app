import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(MySizes.widgetSideSpace),
      child: SizedBox(
        width: double.infinity,
        height: 80.0,
        child: Image(image: AssetImage("assets/images/logo1.png")),
      ),
    );
  }
}
