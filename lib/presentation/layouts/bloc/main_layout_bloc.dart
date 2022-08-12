import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'main_layout_event.dart';

part 'main_layout_state.dart';

class MainLayoutBloc extends Bloc<MainLayoutEvent, MainLayoutState> {
  int index = 0;

  MainLayoutBloc() : super(MainLayoutInitial()) {
    on<MainLayoutEvent>((event, emit) {
      if (event is ChangeIndexEvent) {
        index = event.index;
        emit(ChangeIndexState(index: event.index));
      }
    });
  }
}
