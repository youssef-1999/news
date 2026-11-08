import 'package:news_app/common/error/error_model.dart';
import 'package:news_app/features/news/data/models/article_model.dart';
import 'package:news_app/features/news/data/models/source_model.dart';

abstract class NewsDataSource {
  Future<(ErrorModel? error, List<SourceModel>? data)> getSources(String category);
  Future<(ErrorModel? error, List<ArticleModel>? data)> getArticles(String sourceId);
}
