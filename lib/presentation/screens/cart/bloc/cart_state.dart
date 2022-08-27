part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

//fetch cart state
class FetchCartLoadingState extends CartState {}

class FetchCartLoadedState extends CartState {
  final CartData cart;

  FetchCartLoadedState(this.cart);
}

class FetchCartErrorState extends CartState {
  final String error;

  FetchCartErrorState(this.error);
}

//add or remove product from cart state
class AddOrRemoveProductFromCartState extends CartState {
  final CartItems cartItems;

  AddOrRemoveProductFromCartState({required this.cartItems});
}

//update product quantity
class UpdateProductQuantityState extends CartState {
  final CartModel cartModel;

  UpdateProductQuantityState({required this.cartModel});
}

class IncrementCartItemState extends CartState {}

class DecrementCartItemState extends CartState {}
