import 'package:equatable/equatable.dart';

class WithParams extends Equatable{
  final Object param;

  WithParams({this.param});

  @override
  // TODO: implement props
  List<Object> get props => [param];

}