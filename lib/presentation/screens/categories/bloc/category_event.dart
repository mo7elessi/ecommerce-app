part of 'category_bloc.dart';

abstract class CategoryEvent {
  const CategoryEvent();
}

class FetchCategoriesEvent extends CategoryEvent {}
