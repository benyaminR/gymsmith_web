import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'network_info.dart';

class NetworkInfoImpl implements NetworkInfo{
  final DataConnectionChecker dataConnectionChecker;

  NetworkInfoImpl({@required this.dataConnectionChecker});

  @override
  Future<bool> isConnected() => dataConnectionChecker.hasConnection;
}