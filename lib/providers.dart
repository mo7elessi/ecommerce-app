import 'package:bloc_state_managment/data/repositories/favorite_repository.dart';
import 'package:bloc_state_managment/data/repositories/notification_repository.dart';
import 'package:bloc_state_managment/presentation/layouts/bloc/main_layout_bloc.dart';
import 'package:bloc_state_managment/presentation/screens/favorite/bloc/favorite_bloc.dart';
import 'package:bloc_state_managment/presentation/screens/notifications/bloc/notification_bloc.dart';
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
  BlocProvider<MainLayoutBloc>(create: (context) {
    return MainLayoutBloc();
  }),
  BlocProvider<NetworkBloc>(create: (context) {
    return NetworkBloc()..add(ListenConnection());
  }),
  BlocProvider<UserBloc>(create: (context) {
    return UserBloc();
  }),
  BlocProvider<HomeBloc>(create: (context) {
    return HomeBloc(
      homeRepository: HomeRepositoryImpl(),
    )..add(FetchHomeDataEvent());
  }),
  BlocProvider<ProductBloc>(create: (context) {
    return ProductBloc(productRepository: ProductRepositoryImpl());
  }),
  BlocProvider<CategoryBloc>(create: (context) {
    return CategoryBloc(
      categoryRepository: CategoryRepositoryImpl(),
    )..add(FetchCategoriesEvent());
  }),
  BlocProvider<CartBloc>(create: (context) {
    return CartBloc(cartRepository: CartRepositoryImpl())
      ..add(FetchCartEvent());
  }),
  BlocProvider<NotificationBloc>(create: (context) {
    return NotificationBloc(repo: NotificationRepositoryImpl())
      ..add(FetchNotificationsEvent());
  }),
  BlocProvider<FavoriteBloc>(create: (context) {
    return FavoriteBloc(
      favoriteRepository: FavoriteRepositoryImpl(),
    )..add(FetchFavoriteEvent());
  }),
];
