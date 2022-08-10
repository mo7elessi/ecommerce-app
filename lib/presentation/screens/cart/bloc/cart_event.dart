part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {}

class FetchCartEvent extends CartEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AddOrRemoveProductFromCartEvent extends CartEvent {
  final int productId;

  AddOrRemoveProductFromCartEvent(this.productId);

  @override
  // TODO: implement props
  List<Object?> get props => [productId];
}


class UpdateProductQuantityEvent extends CartEvent {
  final int productId;
  final int quantity;

  UpdateProductQuantityEvent(this.productId, this.quantity);

  @override
  // TODO: implement props
  List<Object?> get props => [productId,quantity];
}
