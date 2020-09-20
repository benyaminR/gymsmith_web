part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState extends Equatable{}

class LoadingNavigationState extends NavigationState {
  @override
  List<Object> get props => [];
}

class InitialNavigationState extends NavigationState {
  @override
  List<Object> get props => [];
}

class LoadedNavigationState extends NavigationState{
  final Widget widget;
  final Widget previous;

  LoadedNavigationState({@required this.widget, @required this.previous});
  @override
  List<Object> get props => [widget,previous];
}