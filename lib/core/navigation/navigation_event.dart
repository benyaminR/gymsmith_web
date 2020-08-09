part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent extends Equatable {
}

class ChangePageEvent extends NavigationEvent{
  final Widget widget;
  final Widget previous;

  ChangePageEvent({@required this.widget, @required this.previous});

  @override
  List<Object> get props => [widget,previous];

}