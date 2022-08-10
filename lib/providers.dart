import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/cart_repository.dart';
import 'data/repositories/category_repository.dart';
import 'data/repositories/home_repository.dart';
import 'data/repositories/product_repository.dart';
import 'logic/connected_bloc/network_bloc.dart';
import 'presentation/screens/cart/bloc/cart_bloc.dart';
import 'presentation/screens/categories/bloc/category_bloc.dart';
import 'presentation/screens/home/bloc/home_bloc.dart';
import 'presentation/screens/product/bloc/product_bloc.dart';
import 'presentation/screens/user/bloc/bloc.dart';

List<BlocProvider> providers = [
  BlocProvider<NetworkBloc>(
    create: (context) =>
    NetworkBloc()
      ..add(ListenConnection()),
  ),
  BlocProvider<UserBloc>(
    create: (context) => UserBloc(),
  ),
  BlocProvider<HomeBloc>(
    create: (context) =>
    HomeBloc(
      HomeRepositoryImpl(),
    )
      ..add(FetchHomeDataEvent()),
  ),
  BlocProvider<ProductBloc>(
    create: (context) => ProductBloc(ProductRepositoryImpl()),
  ),
  BlocProvider<CategoryBloc>(
    create: (context) =>
    CategoryBloc(CategoryRepositoryImpl())
      ..add(FetchCategoriesEvent()),
  ),
  BlocProvider<CartBloc>(
    create: (context) =>
    CartBloc(CartRepositoryImpl())
      ..add(FetchCartEvent()),
  ),
];