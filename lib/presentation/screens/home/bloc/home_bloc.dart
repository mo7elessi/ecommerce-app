import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_managment/data/model/home_model.dart';
import 'package:bloc_state_managment/data/repositories/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    on<FetchHomeDataEvent>(_onFetchHomeData);
  }

  FutureOr<void> _onFetchHomeData(
    FetchHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(FetchHomeDataLoadingState());
    try {
      final data = await homeRepository.getHomeData();
      emit(FetchHomeDataLoadedState(data));
    } catch (e) {
      emit(FetchHomeDataErrorState(e.toString()));
    }
  }
}
