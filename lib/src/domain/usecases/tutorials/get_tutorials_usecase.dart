import 'package:tutorial/src/core/request/params/tutorial_request.dart';
import 'package:tutorial/src/core/resources/data_state.dart';
import 'package:tutorial/src/core/usecase/usecase.dart';
import 'package:tutorial/src/domain/entities/tutorial/tutorial.dart';
import 'package:tutorial/src/domain/repositories/tutorial_repository.dart';

class GetTutorialsUseCase
    implements UseCase<DataState<List<Tutorial>>, TutorialsRequestParams> {
  final TutorialsRepository _tutorialsRepository;

  GetTutorialsUseCase(this._tutorialsRepository);

  @override
  Future<DataState<List<Tutorial>>> call({TutorialsRequestParams? params}) {
    return _tutorialsRepository.getTutorials(params!);
  }
}
