import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
// import 'package:tutorial/src/data/models/tutorial_model.dart';
// import 'package:tutorial/src/domain/entities/tutorial/tutorial.dart';
// import 'package:retrofit/http.dart' as he;

import 'package:tutorial/src/core/utils/constants.dart';
import 'package:tutorial/src/data/models/responses/tutorials_response_model.dart';

part 'tutorials_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class TutorialsApiService {
  factory TutorialsApiService(Dio dio, {String baseUrl}) = _TutorialsApiService;

  static const headers = <String, dynamic>{
    "Content-Type": "application/json",
    "Authorization":
        "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY0NzUwMTg2MSwiZXhwIjoxNjQ3NTg4MjYxfQ.bnr5zBsD6Tq3fpRhjGCNCQ9mASXOcYmKQwd6MsdC8FC6SwBamOR3NqDKjfhR7n7yp5AlceH8lj5VHwCKYuItsw"
  };
  @GET('/tutorials')
  @Headers(headers)
  Future<HttpResponse<TutorialsResponseModel>> getTutorials({
    @Query("published") bool? published,
    @Query("page") int? page,
    @Query("pageSize") int? pageSize,
  });

  // @POST('/tutorials')
  // @Headers(headers)
  // Future<HttpResponse<TutorialModel>> saveTutorial(
  //     @Body() Map<String, dynamic> body);

  // @DELETE('/tutorials//{id}')
  // @Headers(headers)
  // Future<HttpResponse<void>> removeTutorial(@Path() int? id);
}
