import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'network_info.dart';

class NetworkInfoImpl implements NetworkInfo{
  final Connectivity connectivity;

  NetworkInfoImpl({@required this.connectivity});

  @override
  Future<bool> isConnected() async => (await connectivity.checkConnectivity() == ConnectivityResult.wifi) || (await connectivity.checkConnectivity() == ConnectivityResult.mobile);
}