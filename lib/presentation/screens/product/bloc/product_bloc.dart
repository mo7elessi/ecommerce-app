import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_managment/core/error/failure.dart';
import 'package:bloc_state_managment/data/model/product_model.dart';
import 'package:bloc_state_managment/data/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
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
          .debounceTime(const Duration(milliseconds: 500))
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
      var data = await productRepository!.search(text: event.text);
      emit(SearchLoadedState(data));
    } catch (e) {
      emit(SearchErrorState(e.toString()));
    }
  }
}
