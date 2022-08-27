import 'package:bloc_state_managment/core/error/failure.dart';
import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/core/util/my_box_decoration.dart';
import 'package:bloc_state_managment/presentation/widgets/app_bar_widget.dart';
import 'package:bloc_state_managment/presentation/widgets/loading_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/list_view_widget.dart';
import 'bloc/notification_bloc.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: "Notifications"),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! NotificationLoadingState,
            fallback: (context) => const LoadingWidget(),
            builder: (context) {
              if (state is NotificationLoadedState) {
                return ListViewWidget(
                  builder: (context, index) => Container(
                    padding: const EdgeInsets.only(top: 4.0,bottom: 4.0),
                    decoration: myBoxDecoration,
                    child: ListTile(
                      title:
                      Text("${state.notificationModel[index].title}"),
                      subtitle: Text(
                          "${state.notificationModel[index].message}"),
                    ),
                  ),
                  length: state.notificationModel.length,
                );
              }
              return const Center(child: Text("Unknown error!)"));
            },
          );
        },
      ),
    );
  }
}
