import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/networking/network_info_impl.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements Connectivity{}


void main(){

  MockDataConnectionChecker mockConnectivity;
  NetworkInfoImpl networkInfoImpl;

  setUp((){
    mockConnectivity = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(connectivity:mockConnectivity);
  });

  test('should forward to DataConnectionChecker.hasConnection', ()async{

    //arrange
    final expected = Future.value(ConnectivityResult.wifi);
    when(mockConnectivity.checkConnectivity()).thenAnswer((realInvocation) => expected);

    //act
    final result = await networkInfoImpl.isConnected();

    //assert
    verify(mockConnectivity.checkConnectivity());
    expect(result, true);

  });
}