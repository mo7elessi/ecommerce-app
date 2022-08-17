import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/presentation/screens/user/bloc/bloc.dart';
import 'package:bloc_state_managment/presentation/screens/user/screens/wrapper.dart';
import 'package:bloc_state_managment/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/routes.dart';
import '../widgets/action_builder.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return WrapperWidget(
      title: "verify email",
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Enter your email to send code to verify email."),
            const SizedBox(height: MySizes.verticalSpace),
            TextFieldWidget(
              controller: emailController,
              hint: 'Enter email',
              keyboard: TextInputType.emailAddress,
              prefixIcon: Icons.email,
              validator: () {},
            ),
            const SizedBox(height: MySizes.verticalSpace),
            ActionBuilderWidget(
              primaryButtonFunction: () {
                if (emailController.text.isNotEmpty) {
                  context.read<UserBloc>().add(
                        VerifyEmailEvent(email: emailController.text),
                      );
                }
              },
              primaryButtonText: 'send code',
              secondaryButtonFunction: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.loginScreen,
                  (Route<dynamic> route) => false,
                );
              },
              secondaryButtonText: 'back',
              navigatorFunction: () {},
            ),
          ],
        ),
      ),
    );
  }
}
