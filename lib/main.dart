import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:bloc_state_managment/data/network/remote/dio_helper.dart';
import 'package:bloc_state_managment/data/repositories/category_repository.dart';
import 'package:bloc_state_managment/logic/bloc_delegate.dart';
import 'package:bloc_state_managment/logic/category_bloc/category_bloc.dart';
import 'package:bloc_state_managment/logic/connected_bloc/network_bloc.dart';
import 'package:bloc_state_managment/presentation/router/app_router.dart';
import 'package:bloc_state_managment/presentation/screens/categories_screen/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = ApplicationBlocObserver();
  DioHelper.init();
  // BlocOverrides.runZoned(
  //   () {
  //     runApp(const MyApp());
  //   },
  //   blocObserver: ApplicationBlocObserver(),
  // );
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
      theme: Themes.theme,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NetworkBloc>(
            create: (context) => NetworkBloc()..add(ListenConnection()),
          ),
          BlocProvider<CategoryBloc>(
            create: (context) =>
                CategoryBloc(CategoryRepositoryImplementation())
                  ..add(FetchCategoriesEvent()),
          ),
        ],
        child: const CategoriesScreen(),
      ),
    );
  }
}
