

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:gymsmith_web/core/networking/network_info.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/data/datasources/items_remote_datasource.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/data/respositories/items_repository_implementation.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/repositories/items_repository.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/usecases/get_deals_of_the_day_usecase.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/presenation/deals_of_the_day/deals_of_the_day_bloc.dart';
final sl = GetIt.instance;

Future<void> init() async{
  //Features

  //deals of the day
  sl.registerFactory(() => DealsOfTheDayBloc(Empty(),getDealsOfTheDayUsecase: sl()));

  //domain
  sl.registerLazySingleton(() => GetDealsOfTheDayUsecase(repository: sl()));

  sl.registerLazySingleton<ItemsRepository>(() => ItemsRepositoryImplementation(
      networkInfo: sl(),
      itemsRemoteDataSource: sl()
  ));

  sl.registerLazySingleton<ItemsRemoteDataSource>(() =>ItemsRemoteDataSourceImpl(firestore: sl()));


  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(dataConnectionChecker: sl()));

  //Externals
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => Firestore.instance);

}