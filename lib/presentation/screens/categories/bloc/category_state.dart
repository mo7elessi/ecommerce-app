part of 'category_bloc.dart';

abstract class CategoryState {
  const CategoryState();
}

class CategoryInitial extends CategoryState {}

class CategoriesLoadingState extends CategoryState {}

class CategoriesLoadedState extends CategoryState {
  final CategoryModel category;

  CategoriesLoadedState(this.category);
}

class CategoriesErrorState extends CategoryState {
  final String error;

  CategoriesErrorState(this.error);
}

class ProductsByCategoryLoadingState extends CategoryState {}

class ProductsByCategoryLoadedState extends CategoryState {
  final List<Product> product;

  ProductsByCategoryLoadedState({required this.product});
}

class ProductsByCategoryErrorState extends CategoryState {
  final String error;

  ProductsByCategoryErrorState(this.error);
}
