import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {

  NavigationBloc(NavigationState initialState) : super(initialState);

  @override
  NavigationState get initialState => InitialNavigationState();

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if(event is ChangePageEvent) {
     final widget = event.widget == null ? Container() : event.widget;
     final previous = event.previous == null ? Container() : event.previous;
     yield LoadingNavigationState();
     yield LoadedNavigationState(widget: widget,previous: previous);
    }
  }
}
