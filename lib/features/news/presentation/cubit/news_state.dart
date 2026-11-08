import 'package:news_app/enums/news_category.dart';
import 'package:news_app/features/news/domain/entity/article_entity.dart';
import 'package:news_app/features/news/domain/entity/source_entity.dart';

abstract class NewsState {
  final NewsCategory? selectedCategory;

  NewsState({this.selectedCategory});
}

class NewsInitialState extends NewsState {
  NewsInitialState() : super(selectedCategory: null);
}

class SelectedCategoryState extends NewsState {
  SelectedCategoryState({required super.selectedCategory});
}

//sources
class GetSourcesLoading extends NewsState {
  GetSourcesLoading({required super.selectedCategory});
}

class GetSourcesSuccess extends NewsState {
  final List<SourceEntity> sources;
  GetSourcesSuccess({required super.selectedCategory, required this.sources});
}

class GetSourcesError extends NewsState {
  final String? message;
  GetSourcesError({required super.selectedCategory, this.message});
}

//articles
class GetArticlesLoading extends NewsState {
  final String sourceId;
  GetArticlesLoading({required super.selectedCategory, required this.sourceId});
}

class GetArticlesSuccess extends NewsState {
  final String sourceId;
  final List<ArticleEntity> articles;
  GetArticlesSuccess({
    required super.selectedCategory,
    required this.sourceId,
    required this.articles,
  });
}

class GetArticlesError extends NewsState {
  final String sourceId;
  final String? message;
  GetArticlesError({
    required super.selectedCategory,
    required this.sourceId,
    this.message,
  });
}
