part of 'main_layout_bloc.dart';

@immutable
abstract class MainLayoutState {}

class MainLayoutInitial extends MainLayoutState {}

class ChangeIndexState extends MainLayoutState{
  final int index;

  ChangeIndexState({required this.index});
}