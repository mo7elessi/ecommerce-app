import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/material.dart';

part 'network_event.dart';

part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(ConnectionInitial()) {
    on<ListenConnection>(_onConnected);
  }

  StreamSubscription? _subscription;

  Stream<NetworkState> _onConnected(
    NetworkEvent event,
    Emitter<NetworkState> emit,
  ) async* {
    _subscription = InternetConnectionChecker().onStatusChange.listen((status) {
      status == InternetConnectionStatus.disconnected
          ? emit(ConnectionFailure())
          : emit(ConnectionSuccess());
    });
  }

  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }
}
