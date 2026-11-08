import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/common/error/error_model.dart';
import 'package:news_app/common/network/api_consts.dart';
import 'package:news_app/common/network/endpoint.dart';
import 'package:news_app/features/news/data/data_source/news_data_source.dart';
import 'package:news_app/features/news/data/models/article_model.dart';
import 'package:news_app/features/news/data/models/article_response_model.dart';
import 'package:news_app/features/news/data/models/source_model.dart';

@Injectable(as: NewsDataSource)
class NewsRemoteDataSource implements NewsDataSource {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConsts.baseUrl));

  @override
  Future<(ErrorModel?, List<SourceModel>?)> getSources(String category) => _get(
        Endpoint.sources,
        {'category': category},
        (data) => SourcesResponseModel.fromMap(data).sources ?? [],
      );

  @override
  Future<(ErrorModel?, List<ArticleModel>?)> getArticles(String sourceId) =>
      _get(
        Endpoint.articles,
        {'sources': sourceId},
        (data) => ArticleResponseModel.fromMap(data).articles ?? [],
      );

  // Shared request + error handling for every NewsAPI call
  Future<(ErrorModel?, T?)> _get<T>(
    String path,
    Map<String, dynamic> query,
    T Function(Map<String, dynamic> data) parse,
  ) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: {...query, 'apiKey': ApiConsts.apiKey},
      );
      final data = response.data;
      if (data is Map<String, dynamic> && data['status'] == 'ok') {
        return (null, parse(data));
      }
      return (
        GeneralError(
          errorMessage: data is Map ? data['message'] as String? : null,
          errorCode: data is Map ? data['code'] as String? : null,
        ),
        null,
      );
    } on DioException catch (e) {
      final error = ErrorModel.fromDioException(e);
      log('Error: ${error.message} (${error.errorCode})');
      return (error, null);
    } catch (e) {
      log('Error: $e');
      return (TypeParseError(errorMessage: e.toString()), null);
    }
  }
}
