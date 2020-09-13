import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';
import 'package:meta/meta.dart';

part 'pdp_event.dart';

part 'pdp_state.dart';

class PdpBloc extends Bloc<PdpEvent, PdpState> {

  CartItemData cartItemData;

  PdpBloc(PdpState initialState):super(initialState){
    //cartItemData
  }
  @override
  PdpState get initialState => InitialPdpState();

  @override
  Stream<PdpState> mapEventToState(PdpEvent event) async* {
    // TODO: Add your event logic
  }
}
