import 'package:bloc_state_managment/core/routes/routes.dart';
import 'package:bloc_state_managment/data/model/category_model.dart';
import 'package:bloc_state_managment/presentation/layouts/main_layout.dart';
import 'package:bloc_state_managment/presentation/screens/categories/products_by_category_screen.dart';
import 'package:bloc_state_managment/presentation/screens/home/home_screen.dart';
import 'package:bloc_state_managment/presentation/screens/notifications/notifications_screen.dart';
import 'package:bloc_state_managment/presentation/screens/product/product_details.dart';
import 'package:bloc_state_managment/presentation/screens/user/screens/login_screen.dart';
import 'package:bloc_state_managment/presentation/screens/user/screens/register_screen.dart';
import 'package:bloc_state_managment/presentation/screens/user/screens/reset_password.dart';
import 'package:bloc_state_managment/presentation/screens/user/screens/verify_code_screen.dart';
import 'package:bloc_state_managment/presentation/screens/user/screens/verify_email_screen.dart';
import 'package:flutter/material.dart';

import '../../data/model/product_model.dart';
import '../screens/categories/categories_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.categoriesScreen:
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.verifyCodeScreen:
        return MaterialPageRoute(builder: (_) => const VerifyCodeScreen());
      case Routes.verifyEmailScreen:
        return MaterialPageRoute(builder: (_) => const VerifyEmailScreen());
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.notificationsScreen:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case Routes.productsByCategoryScreen:
        if (args is CategoryModel) {
          return MaterialPageRoute(
            builder: (_) => ProductsByCategoryScreen(categoryItem: args),
          );
        }
        return errorRoute(settings);
      case Routes.productDetailsScreen:
        if (args is ProductModel) {
          return MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(product: args),
          );
        }
        return errorRoute(settings);
      case Routes.mainLayoutScreen:
        return MaterialPageRoute(builder: (_) => MainLayout());
      default:
        return errorRoute(settings);
    }
  }
}

errorRoute(RouteSettings settings) {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      body: Center(
        child: Text('No route defined for ${settings.name}'),
      ),
    );
  });
}
