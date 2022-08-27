part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FetchFavoriteLoadingState extends FavoriteState {}

class FetchFavoriteLoadedState extends FavoriteState {
  final List<FavoriteModel> favorite;

  FetchFavoriteLoadedState({required this.favorite});
}

class FetchFavoriteErrorState extends FavoriteState {
  final String error;

  FetchFavoriteErrorState({required this.error});
}

class AddOrRemoveProductFromFavoriteState extends FavoriteState {
  // final FavoriteItems favoriteItems;
  //
  // AddOrRemoveProductFromFavoriteState({required this.favoriteItems});
}
