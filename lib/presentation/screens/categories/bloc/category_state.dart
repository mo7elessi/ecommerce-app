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
