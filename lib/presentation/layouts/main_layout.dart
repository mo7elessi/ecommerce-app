import 'package:bloc_state_managment/core/routes/routes.dart';
import 'package:bloc_state_managment/presentation/layouts/bloc/main_layout_bloc.dart';
import 'package:bloc_state_managment/presentation/screens/favorite/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_state_managment/presentation/screens/cart/cart_screen.dart';
import 'package:bloc_state_managment/presentation/screens/categories/categories_screen.dart';
import 'package:bloc_state_managment/presentation/screens/home/home_screen.dart';
import '../screens/home/home_screen.dart';

class MainLayout extends StatelessWidget {
  MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutBloc, MainLayoutState>(
      builder: (context, state) {
        MainLayoutBloc bloc = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              titles[bloc.index],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.notificationsScreen);
                },
                icon: const Icon(Icons.notifications),
              ),
            ],
          ),
          body: screens[bloc.index],
          bottomNavigationBar: BottomNavigationBar(
            items: items,
            currentIndex: bloc.index,
            onTap: (index) => bloc.add(ChangeIndexEvent(index: index)),
          ),
        );
      },
    );
  }

  final List<Widget> screens = const [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    FavoriteScreen(),
    CartScreen()
  ];
  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: "Categories", icon: Icon(Icons.category)),
    BottomNavigationBarItem(label: "Cart", icon: Icon(Icons.shopping_cart)),
    BottomNavigationBarItem(label: "Favorite", icon: Icon(Icons.bookmark)),
    BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person))
  ];
  final List<String> titles = [
    "Discover",
    "Categories",
    "Cart",
    "Favorite",
    "Profile"
  ];
}
