part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class FetchFavoriteEvent extends FavoriteEvent {}

class AddOrRemoveProductFromFavoriteEvent extends FavoriteEvent {
  final int productId;

  AddOrRemoveProductFromFavoriteEvent(this.productId);
}
