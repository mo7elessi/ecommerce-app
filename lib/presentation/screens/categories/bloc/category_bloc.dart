import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_managment/data/model/category_model.dart';

import 'package:bloc_state_managment/data/repositories/category_repository.dart';


part 'category_event.dart';
part 'category_state.dart';


class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc(this.categoryRepository) : super(CategoryInitial()) {
    on<FetchCategoriesEvent>(_onFetchCategories);
  }

  Future<void> _onFetchCategories(
    FetchCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoriesLoadingState());
    try {
      final categories = await categoryRepository.getCategories();
      emit(CategoriesLoadedState(categories));
    } catch (e) {
      emit(CategoriesErrorState(e.toString()));
    }
  }
}
