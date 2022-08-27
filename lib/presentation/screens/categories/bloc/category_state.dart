part of 'category_bloc.dart';

abstract class CategoryState {
  const CategoryState();
}

class CategoryInitial extends CategoryState {}

class CategoriesLoadingState extends CategoryState {}

class CategoriesLoadedState extends CategoryState {
  final List<CategoryModel> category;

  CategoriesLoadedState({required this.category});
}

class CategoriesErrorState extends CategoryState {
  final String error;

  CategoriesErrorState({required this.error});
}

class ProductsByCategoryLoadingState extends CategoryState {}

class ProductsByCategoryLoadedState extends CategoryState {
  final List<ProductModel> product;

  ProductsByCategoryLoadedState({required this.product});
}

class ProductsByCategoryErrorState extends CategoryState {
  final String error;

  ProductsByCategoryErrorState({required this.error});
}
