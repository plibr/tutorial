part of 'remote_tutorials_bloc.dart';

abstract class RemoteTutorialsEvent extends Equatable {
  final Tutorial? tutorial;
  const RemoteTutorialsEvent({this.tutorial});

  @override
  List<Object?> get props => [tutorial];
}

class GetTutorials extends RemoteTutorialsEvent {
  const GetTutorials();
}

class SaveTutorial extends RemoteTutorialsEvent {
  const SaveTutorial(Tutorial? tutorial) : super(tutorial: tutorial);
}

class RemoveTutorial extends RemoteTutorialsEvent {
  const RemoveTutorial(Tutorial? tutorial) : super(tutorial: tutorial);
}

class GetAllSavedTutorials extends RemoteTutorialsEvent {
  const GetAllSavedTutorials();
}
