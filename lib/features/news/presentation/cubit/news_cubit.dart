import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/common/models/response_model.dart';
import 'package:news_app/enums/news_category.dart';
import 'package:news_app/features/news/domain/entity/source_entity.dart';
import 'package:news_app/features/news/domain/use_case/get_articles_use_case.dart';
import 'package:news_app/features/news/domain/use_case/get_sources_use_case.dart';
import 'package:news_app/features/news/presentation/cubit/news_state.dart';

@injectable
class NewsCubit extends Cubit<NewsState> {
  final GetSourcesUseCase _getSources;
  final GetArticlesUseCase _getArticles;

  NewsCubit(this._getSources, this._getArticles) : super(NewsInitialState());

  // Kept here because article states replace GetSourcesSuccess right away,
  // often before the UI ever rebuilds with it
  List<SourceEntity> sources = [];

  void selectCategory(NewsCategory category) {
    sources = [];
    emit(SelectedCategoryState(selectedCategory: category));
    getSources(category);
  }

  // Back to Home: no category selected
  void clearCategory() {
    sources = [];
    emit(NewsInitialState());
  }

  Future<void> getSources(NewsCategory category) async {
    emit(GetSourcesLoading(selectedCategory: category));
    final response = await _getSources(category.name);
    switch (response) {
      case ErrorResponse(:final errorModel):
        emit(GetSourcesError(
            selectedCategory: category, message: errorModel.message));
        return;
      case SuccessResponse(:final data):
        sources = data;
        emit(GetSourcesSuccess(selectedCategory: category, sources: sources));
    }

    // Load articles for the first tab
    final firstSourceId = sources.firstOrNull?.id;
    if (firstSourceId != null && firstSourceId.isNotEmpty) {
      getArticles(firstSourceId);
    }
  }

  Future<void> getArticles(String sourceId) async {
    final category = state.selectedCategory;
    emit(GetArticlesLoading(selectedCategory: category, sourceId: sourceId));
    final response = await _getArticles(sourceId);
    switch (response) {
      case ErrorResponse(:final errorModel):
        emit(GetArticlesError(
            selectedCategory: category,
            sourceId: sourceId,
            message: errorModel.message));
      case SuccessResponse(:final data):
        emit(GetArticlesSuccess(
            selectedCategory: category, sourceId: sourceId, articles: data));
    }
  }
}
