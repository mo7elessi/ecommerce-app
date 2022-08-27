import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/data/network/remote/dio_helper.dart';
import 'package:bloc_state_managment/logic/debug/bloc_delegate.dart';
import 'package:bloc_state_managment/presentation/layouts/main_layout.dart';
import 'package:bloc_state_managment/presentation/router/app_router.dart';
import 'package:bloc_state_managment/presentation/screens/categories/categories_screen.dart';
import 'package:bloc_state_managment/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/user/screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: ApplicationBlocObserver(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Demo',
        onGenerateRoute: Routers.generateRoute,
        theme: MyTheme.theme,
        home:   MainLayout(),
      ),
    );
  }
}
