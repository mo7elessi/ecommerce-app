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

  AddOrRemoveProductFromCartState(this.cartItems);
}

//update product quantity
class UpdateProductQuantityState extends CartState {
  final CartModel cartModel;

  UpdateProductQuantityState(this.cartModel);
}

class IncrementCartItemState extends CartState {}

class DecrementCartItemState extends CartState {}
