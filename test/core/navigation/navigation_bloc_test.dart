

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/navigation/navigation_bloc.dart';
import 'package:mockito/mockito.dart';

void main() {
  final bloc = NavigationBloc(LoadingNavigationState());
  final container = Container();
  final previous = Container();

  group('NavigationBloc', (){

    test('should emit in order [LoadedNavigationState]', () async{

      //arrange
      var expected = [LoadingNavigationState(),LoadedNavigationState( widget : container, previous : previous)];

      //act
      bloc.add(ChangePageEvent(widget:container, previous : container));

      //assert
      await expectLater(bloc, emitsInOrder(expected));
    });
  });

}