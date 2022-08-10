import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/data/network/remote/dio_helper.dart';
import 'package:bloc_state_managment/data/repositories/category_repository.dart';
import 'package:bloc_state_managment/data/repositories/home_repository.dart';
import 'package:bloc_state_managment/data/repositories/product_repository.dart';
import 'package:bloc_state_managment/logic/debug/bloc_delegate.dart';
import 'package:bloc_state_managment/logic/connected_bloc/network_bloc.dart';
import 'package:bloc_state_managment/presentation/router/app_router.dart';
import 'package:bloc_state_managment/presentation/screens/user/bloc/user_bloc.dart';
import 'package:bloc_state_managment/presentation/screens/user/screens/login_screen.dart';
import 'package:bloc_state_managment/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories/cart_repository.dart';
import 'presentation/screens/cart/bloc/bloc.dart';
import 'presentation/screens/categories/bloc/bloc.dart';
import 'presentation/screens/home/bloc/bloc.dart';
import 'presentation/screens/product/bloc/product_bloc.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Demo',
      onGenerateRoute: Routers.generateRoute,
      theme: MyTheme.theme,
      home: MultiBlocProvider(
        providers: providers,
        child: const LoginScreen(),
      ),
    );
  }
}
