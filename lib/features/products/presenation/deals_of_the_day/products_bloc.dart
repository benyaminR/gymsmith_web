import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/usecase/no_params.dart';
import 'package:gymsmith_web/features/products/domain/entities/products.dart';
import 'package:gymsmith_web/features/products/domain/usecases/get_deals_of_the_day_usecase.dart';
import 'package:meta/meta.dart';


part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {

  static const String Server_Failure = 'Server Failure';
  static const String Offline_Failure = 'Offline Failure';

  final GetDealsOfTheDayUsecase getDealsOfTheDayUsecase;

  ProductsBloc(ProductsState initialState, {@required this.getDealsOfTheDayUsecase}) : super(initialState);

  ProductsState get initialState => InitialDealsOfTheDayState();

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    print(event);
    if(event is GetDealsOfTheDayEvent){
      yield Loading();
      final failureOrItems = await getDealsOfTheDayUsecase(NoParams());
      yield failureOrItems.fold(
              (l) => _showErrorState(l),
              (r)  => Loaded(items: r)
      );
    }
  }

  Error _showErrorState(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure:
        return Error(msg: Server_Failure);
      case OfflineFailure:
        return Error(msg: Offline_Failure);
      default :
        return Error(msg: 'Unknown Error');
    }

  }
}
