part of 'pdp_bloc.dart';

@immutable
abstract class PdpState extends Equatable{}

class InitialPdpState extends PdpState {
  final Product product;

  InitialPdpState({@required this.product});

  @override
  List<Object> get props => [product];
}


class UpdatedPdpState extends PdpState{
  final CartItemData cartItemData;
  UpdatedPdpState({@required this.cartItemData});
  @override
  List<Object> get props => [];
}

class LoadingPdpState extends PdpState{
  @override
  List<Object> get props => [];
}

class PdpErrorState extends PdpState{
  @override
  List<Object> get props => [];
}