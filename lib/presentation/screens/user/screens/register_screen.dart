import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/presentation/screens/user/screens/wrapper.dart';
import 'package:bloc_state_managment/presentation/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/routes.dart';
import '../../../../data/model/user_model.dart';
import '../../../widgets/error_widget.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/primary_button_widget.dart';
import '../../../widgets/secondary_button_widget.dart';
import '../../../widgets/snack_bar_widget.dart';
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
            primaryButtonText: 'register',
            secondaryButtonFunction: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.loginScreen,
                    (Route<dynamic> route) => false,
              );
            },
            secondaryButtonText: 'login',
            navigatorFunction: () {},
          ),
          // BlocConsumer<UserBloc, UserState>(
          //   listener: (context, state) {
          //     if (state is RegisterSuccessState) {
          //       if (state.status) {
          //       } else {
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           snackBarWidget(message: state.message),
          //         );
          //       }
          //     }
          //   },
          //   builder: (context, state) {
          //     UserData user = UserData(
          //       usernameController.text,
          //       emailController.text,
          //       passwordController.text,
          //       phoneController.text,
          //     );
          //     if (state is RegisterLoadingState) {
          //       return const LoadingWidget();
          //     }
          //     return Column(
          //       children: [
          //         if (state is RegisterErrorState)
          //           ErrorMessageWidget(error: state.message),
          //         const SizedBox(height: MySizes.verticalPadding),
          //         PrimaryButtonWidget(
          //           function: () => context.read<UserBloc>().add(
          //                 RegisterEvent(user),
          //               ),
          //           text: "register",
          //         ),
          //         const SizedBox(height: MySizes.verticalPadding),
          //         SecondaryButtonWidget(
          //           function: () =>
          //               Navigator.pushNamed(context, Routes.loginScreen),
          //           text: "login",
          //         ),
          //       ],
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
