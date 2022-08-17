import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/presentation/screens/user/screens/wrapper.dart';
import 'package:bloc_state_managment/presentation/widgets/form_widget.dart';
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
      title: "registration",
      body: Column(
        children: [
          Form(
            key: formKey,
            child: FormWidget(
              route: Routes.registerScreen,
              usernameController: usernameController,
              emailController: emailController,
              phoneController: phoneController,
              passwordController: passwordController,
            ),
          ),
          const SizedBox(height: MySizes.verticalSpace),
          ActionBuilderWidget(
            primaryButtonFunction: () {
              String username = usernameController.text;
              String email = emailController.text;
              String password = passwordController.text;
              String phone = phoneController.text;
              UserData user = UserData(username, email, password, phone);
              if (email.isNotEmpty &&
                  password.isNotEmpty &&
                  phone.isNotEmpty &&
                  username.isNotEmpty) {
                context.read<UserBloc>().add(RegisterEvent(user));
              }
            },
            primaryButtonText: 'register',
            secondaryButtonFunction: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.loginScreen,
                (Route<dynamic> route) => false,
              );
            },
            secondaryButtonText: 'login',
            navigatorFunction: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.mainLayoutScreen,
                    (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
