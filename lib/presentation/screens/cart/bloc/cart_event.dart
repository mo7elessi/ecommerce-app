part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class FetchCartEvent extends CartEvent {}

class AddOrRemoveProductFromCartEvent extends CartEvent {
  final int productId;

  AddOrRemoveProductFromCartEvent(this.productId);
}

class UpdateProductQuantityEvent extends CartEvent {
  final int productId;
  final int quantity;

  UpdateProductQuantityEvent({required this.productId, required this.quantity});
}
