import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';
import 'package:gymsmith_web/pdp/PdpData.dart';
import 'package:meta/meta.dart';

part 'pdp_event.dart';
part 'pdp_state.dart';

class PdpBloc extends Bloc<PdpEvent, PdpState> {

  PdpData pdpData;

  PdpBloc(EmptyPdpState emptyPdpState):super(emptyPdpState);

  PdpState get initialState => EmptyPdpState();

  @override
  Stream<PdpState> mapEventToState(PdpEvent event) async* {
    if(event is InitializePdpEvent){
      yield LoadingPdpState();
      pdpData = PdpData.fromProduct(event.product);
      yield UpdatedPdpState(pdpData: pdpData);
    }else if(event is ChangeColorEvent){
      yield LoadingPdpState();
      pdpData = PdpData(
          size: pdpData.size,
          color: event.color,
          price: pdpData.price,
          colors: pdpData.colors,
          images: pdpData.images,
          description: pdpData.description,
          name: pdpData.name,
          databaseRef: pdpData.databaseRef
      );
      yield UpdatedPdpState(pdpData: pdpData);
    }else if(event is ChangeSizeEvent){
      yield LoadingPdpState();
      pdpData = PdpData(
          size: event.size,
          color: pdpData.color,
          price: pdpData.price,
          colors: pdpData.colors,
          images: pdpData.images,
          description: pdpData.description,
          name: pdpData.name,
          databaseRef: pdpData.databaseRef
      );
      yield UpdatedPdpState(pdpData: pdpData);
    }

  }
}
