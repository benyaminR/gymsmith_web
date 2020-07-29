import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


final sl = GetIt.instance;

//@injectableInit
//void configureDependencies() => $initGetIt(getIt);

  //Features
/*
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
  sl.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());

  //firestore

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

  sl.registerLazySingleton(() => firestore);
  */

