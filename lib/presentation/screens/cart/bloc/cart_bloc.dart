import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_managment/data/model/cart_model.dart';
import 'package:bloc_state_managment/data/repositories/cart_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc(this.cartRepository) : super(CartInitial()) {
    on<FetchCartEvent>(_onFetchCart);
    on<AddOrRemoveProductFromCartEvent>(_onAddOrRemoveProductFromCart);
    on<UpdateProductQuantityEvent>(_onUpdateProductQuantity);
  }

  Future<void> _onFetchCart(
    FetchCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(FetchCartLoadingState());
    try {
      var data = await cartRepository.getCart();
      emit(FetchCartLoadedState(data.data!));
    } catch (e) {
      emit(FetchCartErrorState(e.toString()));
    }
  }

  Future<void> _onAddOrRemoveProductFromCart(
    AddOrRemoveProductFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      var data = await cartRepository.addOrRemove(productId: event.productId);
      emit(AddOrRemoveProductFromCartState(data));
      add(FetchCartEvent());
    } catch (e) {
      debugPrint("$e");
    }
  }

  Future<void> _onUpdateProductQuantity(
    UpdateProductQuantityEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      var data = await cartRepository.updateQuantity(
        productId: event.productId,
        quantity: event.quantity,
      );
      emit(UpdateProductQuantityState(data));
    } catch (e) {
      debugPrint("$e");
    }
  }
}
