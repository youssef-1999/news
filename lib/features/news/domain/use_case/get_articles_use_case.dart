import 'package:injectable/injectable.dart';
import 'package:news_app/common/models/response_model.dart';
import 'package:news_app/features/news/domain/entity/article_entity.dart';
import 'package:news_app/features/news/domain/repository/news_repository.dart';

@injectable
class GetArticlesUseCase {
  final NewsRepository _repository;

  GetArticlesUseCase(this._repository);

  Future<Response<List<ArticleEntity>>> call(String sourceId) =>
      _repository.getArticles(sourceId);
}
