import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_managment/data/model/cart_model.dart';
import 'package:bloc_state_managment/data/repositories/cart_repository.dart';
import 'package:flutter/material.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc({required this.cartRepository}) : super(CartInitial()) {
    on<FetchCartEvent>(_onFetchCart);
    on<AddOrRemoveProductFromCartEvent>(_onAddOrRemoveProductFromCart);
    on<UpdateProductQuantityEvent>(_onUpdateProductQuantity);
  }

  Future<void> _onFetchCart(
    FetchCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(FetchCartLoadingState());
    var failureOrCart = await cartRepository.getCart();
    failureOrCart.fold(
      (failure) => emit(FetchCartErrorState("failure")),
      (data) => emit(FetchCartLoadedState(data.data!)),
    );
  }

  Future<void> _onAddOrRemoveProductFromCart(
    AddOrRemoveProductFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    var failureOrSuccess = await cartRepository.addOrRemove(
      productId: event.productId,
    );
    failureOrSuccess.fold(
      (failure) => debugPrint(failure.runtimeType.toString()),
      (data) => emit(AddOrRemoveProductFromCartState(cartItems: data)),
    );
  }

  Future<void> _onUpdateProductQuantity(
    UpdateProductQuantityEvent event,
    Emitter<CartState> emit,
  ) async {
    var failureOrSuccess = await cartRepository.updateQuantity(
      productId: event.productId,
      quantity: event.quantity,
    );
    failureOrSuccess.fold(
      (failure) => debugPrint(failure.runtimeType.toString()),
      (data) => emit(UpdateProductQuantityState(cartModel: data)),
    );
  }
}
