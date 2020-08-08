import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gymsmith_web/core/usecase/no_params.dart';
import 'package:gymsmith_web/core/usecase/params.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:gymsmith_web/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:gymsmith_web/features/cart/domain/usecases/remove_from_the_cart_usecase.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  final AddToCartUseCase addToCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  final GetCartUseCase getCartUseCase;

  CartBloc({@required this.addToCartUseCase,@required this.removeFromCartUseCase,@required this.getCartUseCase, @required CartState initialState}) : super(initialState);

  @override
  CartState get initialState => InitialCartState();

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if(event is GetCartEvent){
      var item = await getCartUseCase(NoParams());
      yield* item.fold(
              (l) async* {
                yield CartFailureState();
              },
              (r) async* {
                yield CartGetState();
                yield CartUpdatedState(updatedCart: r);
              }
      );
    }else if(event is RemoveItemFromCartEvent){
      var item = await removeFromCartUseCase(WithParams(param: event.item));
      yield* item.fold(
              (l) async* {
                yield CartFailureState();
              },
              (r) async* {
                yield CartRemoveState();
                yield CartUpdatedState(updatedCart: r);
              }
      );


    }else if(event is AddItemToCartEvent){
      var item = await addToCartUseCase(WithParams(param: event.item));
      print(event.item);
      yield* item.fold(
              (l) async* {
            yield CartFailureState();
          },
              (r) async* {
            yield CartAddState();
            yield CartUpdatedState(updatedCart: r);
          });
    }
  }

}
