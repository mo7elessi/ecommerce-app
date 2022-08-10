import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/presentation/screens/user/screens/wrapper.dart';
import 'package:bloc_state_managment/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';


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
          children: [
            TextFieldWidget(
              controller: emailController,
              hint: 'Enter email',
              keyboard: TextInputType.emailAddress,
              prefixIcon: Icons.email,
              validator: () {},
            ),
            const SizedBox(height: MySizes.verticalPadding),
            // BlocBuilder<UserBloc, UserState>(
            //   builder: (context, state) {
            //     if (state is VerifyEmailLoadingState) {
            //       return const LoadingWidget();
            //     }
            //     return Column(
            //       children: [
            //         if (state is VerifyEmailErrorState)
            //           ErrorMessageWidget(
            //             error: state.message,
            //             icon: Icons.error,
            //           ),
            //         const SizedBox(height: MySizes.verticalPadding),
            //         PrimaryButtonWidget(
            //           function: () => context.read<UserBloc>().add(
            //               VerifyEmailEvent(email: emailController.text)),
            //           text: "send code",
            //         ),
            //       ],
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
