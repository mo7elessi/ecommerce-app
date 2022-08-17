import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_managment/data/model/product_model.dart';
import 'package:bloc_state_managment/data/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository? productRepository;

  ProductBloc(this.productRepository) : super(ProductInitial()) {
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
    try {
      var result = await productRepository!.search(text: event.text);
      emit(SearchLoadedState(products: result.data!.data!));
    } catch (e) {
      emit(SearchErrorState(e.toString()));
    }
  }
}
