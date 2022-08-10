import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/presentation/screens/user/screens/wrapper.dart';
import 'package:bloc_state_managment/presentation/screens/user/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/routes.dart';
import '../../../../data/model/user_model.dart';
import '../bloc/bloc.dart';
import '../widgets/action_builder.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return WrapperWidget(
      title: "register",
      body: Form(
        key: formKey,
        child: Column(
          children: [
            FormWidget(
              route: Routes.registerScreen,
              usernameController: usernameController,
              emailController: emailController,
              phoneController: phoneController,
              passwordController: passwordController,
            ),
            const SizedBox(height: MySizes.verticalPadding),
            ActionBuilderWidget(
              primaryButtonFunction: () {
                UserData user = UserData(
                  usernameController.text,
                  emailController.text,
                  passwordController.text,
                  phoneController.text,
                );
                context.read<UserBloc>().add(
                      RegisterEvent(user),
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
