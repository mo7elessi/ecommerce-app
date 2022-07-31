import 'package:bloc_state_managment/core/routes/routes.dart';
import 'package:bloc_state_managment/presentation/screens/categories_screen/categories_screen.dart';
import 'package:flutter/material.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.categoriesScreen:
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
