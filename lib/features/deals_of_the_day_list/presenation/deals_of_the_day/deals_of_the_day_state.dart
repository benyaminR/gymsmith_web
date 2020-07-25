part of 'deals_of_the_day_bloc.dart';

@immutable
abstract class DealsOfTheDayState extends Equatable{}

class InitialDealsOfTheDayState extends DealsOfTheDayState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Empty extends DealsOfTheDayState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class Loading extends DealsOfTheDayState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class Loaded extends DealsOfTheDayState{
  final Items items;

  Loaded({@required this.items});

  @override
  // TODO: implement props
  List<Object> get props => [];

}
class Error extends DealsOfTheDayState{
  final String msg;

  Error({@required this.msg});
  @override
  // TODO: implement props
  List<Object> get props => [];

}