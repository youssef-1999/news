import 'package:injectable/injectable.dart';
import 'package:news_app/common/models/response_model.dart';
import 'package:news_app/features/news/domain/entity/source_entity.dart';
import 'package:news_app/features/news/domain/repository/news_repository.dart';

@injectable
class GetSourcesUseCase {
  final NewsRepository _repository;

  GetSourcesUseCase(this._repository);

  Future<Response<List<SourceEntity>>> call(String categoryId) =>
      _repository.getSources(categoryId);
}
