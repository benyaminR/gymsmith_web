part of 'pdp_bloc.dart';

@immutable
abstract class PdpState extends Equatable{}

class EmptyPdpState extends PdpState {

  EmptyPdpState();

  @override
  List<Object> get props => [];
}

class UpdatedPdpState extends PdpState{
  final PdpData pdpData;
  UpdatedPdpState({@required this.pdpData});
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