import 'package:tutorial/src/core/request/params/tutorial_request.dart';
import 'package:tutorial/src/core/resources/data_state.dart';
import 'package:tutorial/src/domain/entities/tutorial/tutorial.dart';

abstract class TutorialsRepository {
  // API methods
  Future<DataState<List<Tutorial>>> getTutorials(TutorialsRequestParams params);

  // Future<DataState<Tutorial>> saveTutorial(Tutorial tutorial);

  // Future<DataState<void>> removeTutorial(Tutorial tutorial);
}
