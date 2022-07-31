import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_managment/data/model/category_model/category_model.dart';

import 'package:bloc_state_managment/data/repositories/category_repository.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc(this.categoryRepository) : super(CategoryInitial());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is FetchCategoriesEvent) {
      yield CategoriesLoadingState();
      try {
        final categories = await categoryRepository.getCategories();
        yield CategoriesLoadedState(categories);
      } catch (e) {
        yield CategoriesErrorState(e.toString());
      }
    }
  }
}
