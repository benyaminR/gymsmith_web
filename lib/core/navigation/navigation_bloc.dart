import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/navigation/INavigationWidget.dart';
import 'package:meta/meta.dart';
import 'package:responsive_builder/src/sizing_information.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {

  NavigationBloc(NavigationState initialState) : super(initialState);

  INavigationWidget previous = NavigationContainer();

  @override
  NavigationState get initialState => InitialNavigationState();

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if(event is ChangePageEvent) {
     final widget = event.widget == null ? NavigationContainer() : event.widget;
     yield LoadingNavigationState();
     yield LoadedNavigationState(widget: widget,previous: previous);
     previous = widget;
    }
  }
}

class NavigationContainer extends Container implements INavigationWidget{
  @override
  void onResponsiveness(SizingInformation sizingInformation) {
  }
}