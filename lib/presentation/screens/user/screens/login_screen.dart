import 'package:bloc_state_managment/core/routes/routes.dart';
import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/presentation/screens/user/screens/wrapper.dart';
import 'package:bloc_state_managment/presentation/screens/user/widgets/action_builder.dart';
import 'package:bloc_state_managment/presentation/widgets/form_widget.dart';
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
      body: Column(
        children: [
          Form(
            key: formKey,
            child: FormWidget(
              route: Routes.loginScreen,
              emailController: emailController,
              passwordController: passwordController,
            ),
          ),
          const SizedBox(height: MySizes.verticalPadding),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.verifyEmailScreen,
                  (Route<dynamic> route) => false,
                );
              },
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Text("Forget password?"),
              )),
          const SizedBox(height: MySizes.verticalPadding),
          ActionBuilderWidget(
            primaryButtonFunction: () {
              String password = passwordController.text;
              String email = emailController.text;
              context.read<UserBloc>().add(
                    LoginEvent(
                      password: password,
                      email: email,
                    ),
                  );
            },
            primaryButtonText: 'login',
            secondaryButtonFunction: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.registerScreen,
                (Route<dynamic> route) => false,
              );
            },
            secondaryButtonText: 'register',
            navigatorFunction: () {},
          ),
        ],
      ),
    );
  }
}
