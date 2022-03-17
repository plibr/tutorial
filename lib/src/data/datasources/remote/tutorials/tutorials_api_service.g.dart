// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorials_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _TutorialsApiService implements TutorialsApiService {
  _TutorialsApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://192.168.0.102:8080/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<TutorialsResponseModel>> getTutorials(
      {published, page, pageSize}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'published': published,
      r'page': page,
      r'pageSize': pageSize
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Content-Type': 'application/json',
      r'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY0NzUwMTg2MSwiZXhwIjoxNjQ3NTg4MjYxfQ.bnr5zBsD6Tq3fpRhjGCNCQ9mASXOcYmKQwd6MsdC8FC6SwBamOR3NqDKjfhR7n7yp5AlceH8lj5VHwCKYuItsw'
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<TutorialsResponseModel>>(Options(
                method: 'GET',
                headers: _headers,
                extra: _extra,
                contentType: 'application/json')
            .compose(_dio.options, '/tutorials',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TutorialsResponseModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
