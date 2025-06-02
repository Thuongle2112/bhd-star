// Sự kiện mạng
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

abstract class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object> get props => [];
}

class CheckConnectivity extends NetworkEvent {}

class ConnectivityChanged extends NetworkEvent {
  /// The line `final List<ConnectivityResult> connectionStatus;` in the `ConnectivityChanged` class is
  /// declaring a final property named `connectionStatus` of type `List<ConnectivityResult>`. This
  /// property will hold a list of `ConnectivityResult` objects, which presumably represent the status
  /// of network connectivity. The `final` keyword indicates that once the `connectionStatus` property
  /// is assigned a value, it cannot be changed later.
  final List<ConnectivityResult> connectionStatus;
  const ConnectivityChanged(this.connectionStatus);

  @override
  List<Object> get props => [connectionStatus];
}
