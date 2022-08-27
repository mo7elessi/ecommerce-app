import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_managment/data/model/product_model.dart';
import 'package:bloc_state_managment/data/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<SearchEvent>(
      _onSearch,
      transformer: (eventsStream, mapper) => eventsStream
          .where((event) => event.text.length >= 2)
          .debounceTime(const Duration(seconds: 1))
          .distinct()
          .switchMap(mapper),
    );
  }

  Future<void> _onSearch(
    SearchEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(SearchLoadingState());
    var failureOrProducts = await productRepository.search(text: event.text);
    failureOrProducts.fold(
      (failure) => emit(SearchErrorState("${failure.runtimeType}")),
      (data) => emit((SearchLoadedState(products: data.data!.items!))),
    );
  }
}
