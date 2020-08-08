

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/navigation/navigation_bloc.dart';
import 'package:mockito/mockito.dart';

void main() {
  final bloc = NavigationBloc(LoadingNavigationState());

  group('NavigationBloc', (){

    test('should emit in order [LoadedNavigationState]', () async{

      var container = Container();

      //arrange
      var expected = [LoadedNavigationState( widget : container)];

      //act
      bloc.add(ChangePageEvent(widget:container));

      //assert
      await expectLater(bloc, emitsInOrder(expected));

    });
  });
}