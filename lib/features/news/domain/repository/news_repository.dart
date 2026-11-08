import 'package:news_app/common/models/response_model.dart';
import 'package:news_app/features/news/domain/entity/article_entity.dart';
import 'package:news_app/features/news/domain/entity/source_entity.dart';

abstract class NewsRepository {
  Future<Response<List<ArticleEntity>>> getArticles(String sourceId);
  Future<Response<List<SourceEntity>>> getSources(String categoryId);
}
