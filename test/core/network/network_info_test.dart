import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/networking/network_info_impl.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker{}


void main(){

  MockDataConnectionChecker mockDataConnectionChecker;
  NetworkInfoImpl networkInfoImpl;

  setUp((){
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(dataConnectionChecker:mockDataConnectionChecker);
  });

  test('should forward to DataConnectionChecker.hasConnection', ()async{

    //arrange
    final expected = Future.value(true);
    when(mockDataConnectionChecker.hasConnection).thenAnswer((realInvocation) => expected);

    //act
    final result = networkInfoImpl.isConnected();

    //assert
    verify(mockDataConnectionChecker.hasConnection);
    expect(result, expected);

  });
}