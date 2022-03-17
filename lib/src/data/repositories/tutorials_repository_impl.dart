import 'dart:io';

import 'package:dio/dio.dart';

import 'package:tutorial/src/core/request/params/tutorial_request.dart';
import 'package:tutorial/src/core/resources/data_state.dart';
import 'package:tutorial/src/domain/entities/tutorial/tutorial.dart';
import 'package:tutorial/src/domain/repositories/tutorial_repository.dart';
import 'package:tutorial/src/data/datasources/remote/tutorials/tutorials_api_service.dart';

class TutorialsRepositoryImpl implements TutorialsRepository {
  final TutorialsApiService _tutorialsApiService;

  const TutorialsRepositoryImpl(this._tutorialsApiService);

  // @override
  // Future<DataState<void>> removeTutorial(Tutorial tutorial) async {
  //   try {
  //     final httpResponse =
  //         await _tutorialsApiService.removeTutorial(tutorial.id);

  //     if (httpResponse.response.statusCode == HttpStatus.ok) {
  //       // return DataSuccess(httpResponse.data.tutorial!);
  //       return DataSuccess(httpResponse.data);
  //     }
  //     return DataFailed(
  //       DioError(
  //         error: httpResponse.response.statusMessage,
  //         response: httpResponse.response,
  //         requestOptions: httpResponse.response.requestOptions,
  //         type: DioErrorType.other,
  //       ),
  //     );
  //   } on DioError catch (e) {
  //     return DataFailed(e);
  //   }
  // }

  // @override
  // Future<DataState<Tutorial>> saveTutorial(Tutorial tutorial) async {
  //   try {
  //     final httpResponse = await _tutorialsApiService.saveTutorial({
  //       "title": tutorial.title,
  //       "description": tutorial.description,
  //       "published": tutorial.published
  //     });
  //     // final httpResponse = await _tutorialsApiService.saveTutorial(Tutorial(
  //     //     title: tutorial.title,
  //     //     description: tutorial.description,
  //     //     published: tutorial.published));

  //     if (httpResponse.response.statusCode == HttpStatus.ok) {
  //       // return DataSuccess(httpResponse.data.tutorial!);
  //       return DataSuccess(httpResponse.data);
  //     }
  //     return DataFailed(
  //       DioError(
  //         error: httpResponse.response.statusMessage,
  //         response: httpResponse.response,
  //         requestOptions: httpResponse.response.requestOptions,
  //         type: DioErrorType.other,
  //       ),
  //     );
  //   } on DioError catch (e) {
  //     return DataFailed(e);
  //   }
  // }

  @override
  Future<DataState<List<Tutorial>>> getTutorials(
      TutorialsRequestParams params) async {
    try {
      final httpResponse = await _tutorialsApiService.getTutorials(
        published: params.published,
        page: params.page,
        pageSize: params.pageSize,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.tutorials!);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.other,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
