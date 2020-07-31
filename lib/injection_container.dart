
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';
import 'package:gymsmith_web/core/slideshow/slide_show/slide_show_bloc.dart';
import 'core/networking/network_info.dart';
import 'core/networking/network_info_impl.dart';
import 'features/deals_of_the_day_list/data/datasources/items_remote_datasource.dart';
import 'features/deals_of_the_day_list/data/respositories/items_repository_implementation.dart';
import 'features/deals_of_the_day_list/domain/repositories/items_repository.dart';
import 'features/deals_of_the_day_list/domain/usecases/get_deals_of_the_day_usecase.dart';
import 'features/deals_of_the_day_list/presenation/deals_of_the_day/deals_of_the_day_bloc.dart';



final sl = GetIt.instance;

Future<void> init() async{
  //Features

  //deals of the day
  sl.registerFactory(() => DealsOfTheDayBloc(InitialDealsOfTheDayState(),getDealsOfTheDayUsecase: sl()));
  //domain
  sl.registerLazySingleton(() => GetDealsOfTheDayUsecase(repository: sl()));

  sl.registerLazySingleton<ItemsRepository>(() => ItemsRepositoryImplementation(
      networkInfo: sl(),
      itemsRemoteDataSource: sl()
  ));

  sl.registerLazySingleton<ItemsRemoteDataSource>(() =>ItemsRemoteDataSourceImpl(firestore: sl()));


  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectivity: sl()));

  //Externals
  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  //firestore
  /*
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'test',
    options: const FirebaseOptions(
      googleAppID: '1:79601577497:ios:5f2bcc6ba8cecddd',
      apiKey: 'AIzaSyA9DutQXWq4JAx50JYl4tNAvXppNRG4_Wk',
      projectID: 'gymsmith-test',
      databaseURL: "https://gymsmith-test.firebaseio.com",
      storageBucket: "gymsmith-test.appspot.com",
    ),
  );

  final Firestore firestore = Firestore(app: app);
  */
  sl.registerLazySingleton(() => Firestore.instance);
}
