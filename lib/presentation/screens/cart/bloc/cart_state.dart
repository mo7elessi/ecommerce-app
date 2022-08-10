part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {}

class CartInitial extends CartState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

//fetch cart state
class FetchCartLoadingState extends CartState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FetchCartLoadedState extends CartState {
  final CartModel cartModel;

  FetchCartLoadedState(this.cartModel);

  @override
  // TODO: implement props
  List<Object?> get props => [cartModel];
}

class FetchCartErrorState extends CartState {
  final String error;

  FetchCartErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

//add or remove product from cart state
class AddOrRemoveProductFromCartState extends CartState {
  final CartItems cartItems;

  AddOrRemoveProductFromCartState(this.cartItems);

  @override
  // TODO: implement props
  List<Object?> get props => [cartItems];
}

//update product quantity
class UpdateProductQuantityState extends CartState {
  final CartModel cartModel;

  UpdateProductQuantityState(this.cartModel);

  @override
  // TODO: implement props
  List<Object?> get props => [cartModel];
}
