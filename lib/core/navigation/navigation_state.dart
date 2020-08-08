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
  LoadedNavigationState({@required this.widget});
  @override
  List<Object> get props => [widget];
}