part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class SearchLoadingState extends ProductState {}

class SearchLoadedState extends ProductState {
  final ProductResponse productResponse;

  SearchLoadedState(this.productResponse);
}

class SearchErrorState extends ProductState {
  final String error;

  SearchErrorState(this.error);

}
