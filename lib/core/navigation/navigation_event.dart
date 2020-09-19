part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent extends Equatable {
}

class ChangePageEvent extends NavigationEvent{
  final INavigationWidget widget;

  ChangePageEvent({@required this.widget});

  @override
  List<Object> get props => [widget];

}