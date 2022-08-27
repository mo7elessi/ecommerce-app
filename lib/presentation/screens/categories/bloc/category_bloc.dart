import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_managment/data/model/category_model.dart';
import 'package:bloc_state_managment/data/model/product_model.dart';

import 'package:bloc_state_managment/data/repositories/category_repository.dart';

import '../../../../core/constants/failures.dart';
import '../../../../core/error/failure.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository}) : super(CategoryInitial()) {
    on<FetchCategoriesEvent>(_onFetchCategories);
    on<FetchProductsByCategoryEvent>(_onFetchProductsByCategory);
  }

  Future<void> _onFetchCategories(
    FetchCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoriesLoadingState());
    final failureOrCategories = await categoryRepository.getCategories();
    failureOrCategories.fold(
      (failure) => emit(
        CategoriesErrorState(error: _mapFailureToMessage(failure: failure)),
      ),
      (data) => emit(CategoriesLoadedState(category: data.data!.items!)),
    );
  }

  Future<void> _onFetchProductsByCategory(
    FetchProductsByCategoryEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(ProductsByCategoryLoadingState());
    final failureOrProducts = await categoryRepository.getProductsByCategory(
      categoryId: event.categoryId,
    );
    failureOrProducts.fold(
      (failure) => emit(
        ProductsByCategoryErrorState(
            error: _mapFailureToMessage(failure: failure)),
      ),
      (data) => emit(ProductsByCategoryLoadedState(product: data.data!.items!)),
    );
  }

  String _mapFailureToMessage({required Failure failure}) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return DEFAULT_FAILURE_MESSAGE;
    }
  }
}
