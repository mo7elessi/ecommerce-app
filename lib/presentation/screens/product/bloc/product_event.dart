part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class SearchEvent extends ProductEvent {
  final String text;

  SearchEvent(this.text);
}

class FetchProductByCategoryEvent extends ProductEvent {}

class ProductDetailsEvent extends ProductEvent {}
