part of 'pdp_bloc.dart';

@immutable
abstract class PdpEvent extends Equatable{

}

class InitializePdpEvent extends PdpEvent{
  final Product product;

  InitializePdpEvent({@required this.product});

  @override
  List<Object> get props => [product];

}

class ChangeColorEvent extends PdpEvent{
  final String color;

  ChangeColorEvent({@required this.color});

  @override
  List<Object> get props => [color];

}


class ChangeSizeEvent extends PdpEvent{
  final String size;

  ChangeSizeEvent({@required this.size});

  @override
  List<Object> get props => [size];

}
