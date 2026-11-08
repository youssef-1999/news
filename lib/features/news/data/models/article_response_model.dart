import 'package:news_app/features/news/data/models/article_model.dart';

class ArticleResponseModel {
  final String? status;
  final int? totalResults;
  final List<ArticleModel>? articles;

  const ArticleResponseModel({this.status, this.totalResults, this.articles});

  factory ArticleResponseModel.fromMap(Map<String, dynamic> data) =>
      ArticleResponseModel(
        status: data['status'] as String?,
        totalResults: data['totalResults'] as int?,
        articles: (data['articles'] as List<dynamic>?)
            ?.map((e) => ArticleModel.fromMap(e as Map<String, dynamic>))
            .toList(),
      );
}
