import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

// import 'core/utils/constants.dart';

import 'package:tutorial/src/data/datasources/remote//tutorials/tutorials_api_service.dart';
import 'package:tutorial/src/data/repositories/tutorials_repository_impl.dart';
import 'package:tutorial/src/domain/repositories/tutorial_repository.dart';
import 'package:tutorial/src/domain/usecases/tutorials/get_tutorials_usecase.dart';
// import 'package:tutorial/src/domain/usecases/tutorials/save_tutorial_usecase.dart';
// import 'package:tutorial/src/domain/usecases/tutorials/remove_tutorial_usecase.dart';
import 'package:tutorial/src/presentation/blocs/remote_tutorials/remote_tutorials_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  injector
      .registerSingleton<TutorialsApiService>(TutorialsApiService(injector()));

  // *
  injector.registerSingleton<TutorialsRepository>(
      TutorialsRepositoryImpl(injector()));

  // UseCases
  injector
      .registerSingleton<GetTutorialsUseCase>(GetTutorialsUseCase(injector()));
  // injector
  //     .registerSingleton<SaveTutorialUseCase>(SaveTutorialUseCase(injector()));
  // injector.registerSingleton<RemoveTutorialUseCase>(
  //     RemoveTutorialUseCase(injector()));

  // // Blocs
  injector.registerFactory<RemoteTutorialsBloc>(
    () => RemoteTutorialsBloc(injector()),
  );
}
