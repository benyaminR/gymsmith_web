part of 'deals_of_the_day_bloc.dart';

@immutable
abstract class DealsOfTheDayState extends Equatable{
  const DealsOfTheDayState();
}

class InitialDealsOfTheDayState extends DealsOfTheDayState {
  const InitialDealsOfTheDayState();
  @override
  List<Object> get props => [];
}

class Loading extends DealsOfTheDayState{
  const Loading();
  @override
  List<Object> get props => [];
}
class Loaded extends DealsOfTheDayState{
  final Items items;

  const Loaded({@required this.items});

  @override
  List<Object> get props => [items];

}
class Error extends DealsOfTheDayState{
  final String msg;

  const Error({@required this.msg});
  @override
  List<Object> get props => [msg];

}