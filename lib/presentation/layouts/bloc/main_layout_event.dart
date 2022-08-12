part of 'main_layout_bloc.dart';

@immutable
abstract class MainLayoutEvent {}

class ChangeIndexEvent extends MainLayoutEvent {
  final int index;

  ChangeIndexEvent({required this.index});
}
