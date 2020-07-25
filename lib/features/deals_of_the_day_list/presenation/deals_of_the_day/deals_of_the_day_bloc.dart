import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/usecase/no_params.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/entities/items.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/usecases/get_deals_of_the_day_usecase.dart';
import 'package:meta/meta.dart';

part 'deals_of_the_day_event.dart';

part 'deals_of_the_day_state.dart';

class DealsOfTheDayBloc extends Bloc<DealsOfTheDayEvent, DealsOfTheDayState> {

  static const String Server_Failure = 'Server Failure';
  static const String Offline_Failure = 'Offline Failure';

  final GetDealsOfTheDayUsecase getDealsOfTheDayUsecase;

  DealsOfTheDayBloc(DealsOfTheDayState initialState, {@required this.getDealsOfTheDayUsecase}) : super(initialState);



  @override
  DealsOfTheDayState get initialState => Empty();

  @override
  Stream<DealsOfTheDayState> mapEventToState(DealsOfTheDayEvent event) async* {
    if(event is GetDealsOfTheDay){
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
