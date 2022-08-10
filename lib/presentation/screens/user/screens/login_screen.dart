import 'package:bloc_state_managment/core/routes/routes.dart';
import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/presentation/screens/user/screens/wrapper.dart';
import 'package:bloc_state_managment/presentation/screens/user/widgets/action_builder.dart';
import 'package:bloc_state_managment/presentation/screens/user/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return WrapperWidget(
      title: "login",
      body: Form(
        key: formKey,
        child: Column(
          children: [
            FormWidget(
              route: Routes.loginScreen,
              emailController: emailController,
              passwordController: passwordController,
            ),
            const SizedBox(height: MySizes.verticalPadding),
            ActionBuilderWidget(
              primaryButtonFunction: () {
                context.read<UserBloc>().add(
                      LoginEvent(
                        password: passwordController.text,
                        email: emailController.text,
                      ),
                    );
              },
              primaryButtonText: "login",
              secondaryButtonFunction: () {
                Navigator.pushNamed(context, Routes.registerScreen);
              },
              secondaryButtonText: "register",
              navigatorFunction: () {
                Navigator.pushNamed(context, Routes.loginScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
