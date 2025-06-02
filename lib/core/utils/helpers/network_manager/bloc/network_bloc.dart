import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../../../popups/loaders.dart';
import 'network_event.dart';
import 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final Connectivity _connectivity;
  final BuildContext context;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  NetworkBloc(this._connectivity, this.context) : super(const NetworkState([])) {
    on<NetworkEvent>((event, emit) async {
      if (event is CheckConnectivity || event is ConnectivityChanged) {
        try {
          final result = event is CheckConnectivity
              ? await _connectivity.checkConnectivity()
              : (event as ConnectivityChanged).connectionStatus;

          emit(NetworkState(result));

          if (result.contains(ConnectivityResult.none)) {
            TLoaders.customToast(message: 'No Internet Connection', context: context);
          }
        } on PlatformException {
          emit(const NetworkState([]));
        }
      }
    });

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      add(ConnectivityChanged(result));
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
