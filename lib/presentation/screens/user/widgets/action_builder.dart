import 'package:bloc_state_managment/presentation/widgets/snack_bar_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/app_theme.dart';
import '../../../widgets/error_widget.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/primary_button_widget.dart';
import '../../../widgets/secondary_button_widget.dart';
import '../bloc/bloc.dart';

class ActionBuilderWidget extends StatelessWidget {
  final Function primaryButtonFunction;
  final String primaryButtonText;
  final Function secondaryButtonFunction;
  final String secondaryButtonText;
  final Function navigatorFunction;

  const ActionBuilderWidget({
    Key? key,
    required this.primaryButtonFunction,
    required this.primaryButtonText,
    required this.secondaryButtonFunction,
    required this.secondaryButtonText,
    required this.navigatorFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserSuccessState) {
          if (state.status) {
            navigatorFunction();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              snackBarWidget(message: state.message),
            );
          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! UserLoadingState,
          builder: (context) {
            return Column(
              children: [
                PrimaryButtonWidget(
                  text: primaryButtonText,
                  function: () => primaryButtonFunction(),
                ),
                const SizedBox(height: MySizes.verticalSpace),
                SecondaryButtonWidget(
                  text: secondaryButtonText,
                  function: () => secondaryButtonFunction(),
                ),
              ],
            );
          },
          fallback: (context) => const LoadingWidget(),
        );
      },
    );
  }
}
