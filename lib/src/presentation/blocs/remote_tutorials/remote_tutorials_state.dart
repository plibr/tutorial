part of 'remote_tutorials_bloc.dart';

abstract class RemoteTutorialsState extends Equatable {
  final List<Tutorial>? tutorials;
  final bool? noMoreData;
  final DataState<Tutorial>? tutorial;

  final DioError? error;

  const RemoteTutorialsState(
      {this.tutorials, this.noMoreData, this.error, this.tutorial});

  @override
  List<Object?> get props {
    return [tutorials, noMoreData, error, tutorial];
  }
}

class RemoteTutorialsLoading extends RemoteTutorialsState {
  const RemoteTutorialsLoading();
}

class RemoteTutorialsDone extends RemoteTutorialsState {
  RemoteTutorialsDone(List<Tutorial>? tutorial, {bool? noMoreData})
      : super(tutorials: tutorial!, noMoreData: noMoreData);

  @override
  List<Object?> get props {
    return [tutorials!, noMoreData!];
  }
}

class RemoteSavedTutorialDone extends RemoteTutorialsState {
  RemoteSavedTutorialDone(DataState<Tutorial>? tutorial, {bool? noMoreData})
      : super(tutorial: tutorial!, noMoreData: noMoreData);

  @override
  List<Object?> get props {
    return [tutorial!, noMoreData!];
  }
}

class RemoteTutorialsError extends RemoteTutorialsState {
  const RemoteTutorialsError(DioError error) : super(error: error);
  @override
  List<Object?> get props {
    return [error!];
  }
}
