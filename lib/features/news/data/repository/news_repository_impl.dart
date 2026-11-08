import 'package:injectable/injectable.dart';
import 'package:news_app/common/models/response_model.dart';
import 'package:news_app/features/news/data/data_source/news_data_source.dart';
import 'package:news_app/features/news/domain/entity/article_entity.dart';
import 'package:news_app/features/news/domain/entity/source_entity.dart';
import 'package:news_app/features/news/domain/repository/news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  final NewsDataSource _dataSource;

  NewsRepositoryImpl(this._dataSource);

  @override
  Future<Response<List<SourceEntity>>> getSources(String categoryId) async {
    final (error, data) = await _dataSource.getSources(categoryId);
    if (error != null) return ErrorResponse(errorModel: error);
    return SuccessResponse(
      data: (data ?? []).map((source) => source.toEntity()).toList(),
    );
  }

  @override
  Future<Response<List<ArticleEntity>>> getArticles(String sourceId) async {
    final (error, data) = await _dataSource.getArticles(sourceId);
    if (error != null) return ErrorResponse(errorModel: error);
    return SuccessResponse(
      data: (data ?? []).map((article) => article.toEntity()).toList(),
    );
  }
}
