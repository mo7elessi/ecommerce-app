import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_managment/data/model/category_model.dart';
import 'package:bloc_state_managment/data/model/product_model.dart';

import 'package:bloc_state_managment/data/repositories/category_repository.dart';

import '../../../../core/error/exceptions.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc(this.categoryRepository) : super(CategoryInitial()) {
    on<FetchCategoriesEvent>(_onFetchCategories);
    on<FetchProductsByCategoryEvent>(_onFetchProductByCategory);
  }

  Future<void> _onFetchCategories(
    FetchCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoriesLoadingState());
    try {
      final categories = await categoryRepository.getCategories();
      emit(CategoriesLoadedState(categories));
    } on GetDataException catch (e) {
      emit(CategoriesErrorState(e.toString()));
    }
  }

  Future<void> _onFetchProductByCategory(
    FetchProductsByCategoryEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(ProductsByCategoryLoadingState());
    try {
      final products = await categoryRepository.getProductsByCategory(
        categoryId: event.categoryId,
      );
      emit(ProductsByCategoryLoadedState(product: products.data!.data!));
    } on GetDataException catch (e) {
      emit(ProductsByCategoryErrorState(e.toString()));
    }
  }
}
