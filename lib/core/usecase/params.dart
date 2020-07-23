import 'package:equatable/equatable.dart';

class Params extends Equatable{
  final Object param;

  Params({this.param});

  @override
  // TODO: implement props
  List<Object> get props => [param];

}