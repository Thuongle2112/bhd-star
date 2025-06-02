// Trạng thái mạng
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

class NetworkState extends Equatable {
  final List<ConnectivityResult> connectionStatus;

  const NetworkState(this.connectionStatus);

  @override
  List<Object> get props => [connectionStatus];
}
