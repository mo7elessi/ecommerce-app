part of 'category_bloc.dart';

abstract class CategoryEvent {
  const CategoryEvent();
}

class FetchCategoriesEvent extends CategoryEvent {}

class FetchProductsByCategoryEvent extends CategoryEvent {
  final int categoryId;

  FetchProductsByCategoryEvent({required this.categoryId});
}
