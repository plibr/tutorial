import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:tutorial/src/core/bloc/bloc_with_state.dart';
import 'package:tutorial/src/core/request/params/tutorial_request.dart';
import 'package:tutorial/src/core/resources/data_state.dart';
import 'package:tutorial/src/domain/entities/tutorial/tutorial.dart';
import 'package:tutorial/src/domain/usecases/tutorials/get_tutorials_usecase.dart';
// import 'package:tutorial/src/domain/usecases/tutorials/save_tutorial_usecase.dart';
// import 'package:tutorial/src/domain/usecases/tutorials/remove_tutorial_usecase.dart';

part 'remote_tutorials_event.dart';
part 'remote_tutorials_state.dart';

class RemoteTutorialsBloc
    extends BlocWithState<RemoteTutorialsEvent, RemoteTutorialsState> {
  final GetTutorialsUseCase _getTutorialsUseCase;
  // final SaveTutorialUseCase _saveTutorialUseCase;
  // final RemoveTutorialUseCase _removeTutorialUseCase;

  final List<Tutorial> _tutorials = [];
  int _page = 1;
  static const int _pageSize = 5;

  // RemoteTutorialsBloc(this._getTutorialsUseCase, this._saveTutorialUseCase,
  //     this._removeTutorialUseCase)
  RemoteTutorialsBloc(this._getTutorialsUseCase)
      : super(const RemoteTutorialsLoading()) {
    on<GetAllSavedTutorials>(((event, emit) {}));
    on<GetTutorials>((event, emit) => _eventA(event, emit));
    // on<SaveTutorial>(
    //   (event, emit) async {
    //     final tutorial = await _saveTutorialUseCase(params: event.tutorial);
    //     emit(RemoteSavedTutorialDone(tutorial));
    //   },
    // );
    // on<RemoveTutorial>(((event, emit) async {
    //   // final tutorial =
    //   await _removeTutorialUseCase(params: event.tutorial);
    //   // emit(RemoteSavedTutorialDone(tutorial));
    // }));
  }

  void _eventA(event, emit) async {
    await for (final result in _getTutorials(event)) {
      if (event is GetTutorials) emit(result);
    }
  }

  Stream<RemoteTutorialsState> _getTutorials(
      RemoteTutorialsEvent event) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _getTutorialsUseCase(
          params: TutorialsRequestParams(page: _page));

      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        final tutorials = dataState.data;
        final noMoreData = tutorials!.length < _pageSize;
        _tutorials.addAll(tutorials);
        _page++;

        yield RemoteTutorialsDone(_tutorials, noMoreData: noMoreData);
      }
      if (dataState is DataFailed) {
        yield RemoteTutorialsError(dataState.error!);
      }
    });
  }

  // @override
  // void onChange(Change<RemoteTutorialsState> change) {
  //   super.onChange(change);
  //   print(change);
  // }

  // @override
  // void onTransition(
  //     Transition<RemoteTutorialsEvent, RemoteTutorialsState> transition) {
  //   super.onTransition(transition);
  //   print(transition);
  // }
}
