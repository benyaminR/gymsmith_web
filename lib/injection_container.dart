import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:gymsmith_web/core/navigation/navigation_bloc.dart';
import 'package:gymsmith_web/core/utils/translation/languages.dart';
import 'package:gymsmith_web/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:gymsmith_web/features/authentication/data/repository/auth_repo_impl.dart';
import 'package:gymsmith_web/features/authentication/domain/repository/auth_repo.dart';
import 'package:gymsmith_web/features/authentication/domain/usecase/sign_in_anonymously_usecase.dart';
import 'package:gymsmith_web/features/authentication/presentation/auth/auth_bloc.dart';
import 'package:gymsmith_web/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:gymsmith_web/features/cart/data/repository/cart_repository_impl.dart';
import 'package:gymsmith_web/features/cart/domain/repository/cart_repository.dart';
import 'package:gymsmith_web/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:gymsmith_web/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:gymsmith_web/features/cart/domain/usecases/remove_from_the_cart_usecase.dart';
import 'package:gymsmith_web/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/networking/network_info.dart';
import 'core/networking/network_info_impl.dart';
import 'core/utils/translation/translator.dart';
import 'features/deals_of_the_day_list/data/datasources/items_remote_datasource.dart';
import 'features/deals_of_the_day_list/data/respositories/items_repository_implementation.dart';
import 'features/deals_of_the_day_list/domain/repositories/items_repository.dart';
import 'features/deals_of_the_day_list/domain/usecases/get_deals_of_the_day_usecase.dart';
import 'features/deals_of_the_day_list/presenation/deals_of_the_day/deals_of_the_day_bloc.dart';



final sl = GetIt.instance;

Future<void> init() async {

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

  //cart
  sl.registerLazySingleton(() => CartBloc(
      removeFromCartUseCase: sl(),
      getCartUseCase: sl(),
      addToCartUseCase: sl(),
      initialState: InitialCartState()
  ));

  sl.registerLazySingleton(()=> RemoveFromCartUseCase(repository: sl()));
  sl.registerLazySingleton(()=> AddToCartUseCase(repository: sl()));
  sl.registerLazySingleton(()=> GetCartUseCase(repository: sl()));

  sl.registerLazySingleton<CartRepository>(()=> CartRepositoryImpl(dataSource: sl()));
  sl.registerLazySingleton<CartRemoteDataSource>(() => CartRemoteDataSourceImpl(firebaseAuth: sl(),firestore: sl()));

  //Auth
  sl.registerLazySingleton(() => AuthBloc(InitialAuthState(),signInAnonymouslyUseCase: sl()));

  sl.registerLazySingleton(() => SignInAnonymouslyUseCase(repo: sl()));

  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(dataSource: sl()));

  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(firebaseAuth: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectivity: sl()));

  sl.registerLazySingleton(() => NavigationBloc(LoadingNavigationState()));
  WidgetsFlutterBinding.ensureInitialized();
  var translator = Translator();
  await translator.init(Language.en);
  sl.registerLazySingleton(() => translator);


  //Externals
  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(()=> sharedPreferences);

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
  sl.registerLazySingleton(() => FirebaseAuth.instance);
}
