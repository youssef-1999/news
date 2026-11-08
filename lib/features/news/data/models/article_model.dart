import 'package:news_app/features/news/data/models/article_source_model.dart';
import 'package:news_app/features/news/domain/entity/article_entity.dart';

class ArticleModel {
  final ArticleSourceModel? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticleModel.fromMap(Map<String, dynamic> data) => ArticleModel(
        source: data['source'] == null
            ? null
            : ArticleSourceModel.fromMap(data['source'] as Map<String, dynamic>),
        author: data['author'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        url: data['url'] as String?,
        urlToImage: data['urlToImage'] as String?,
        publishedAt: data['publishedAt'] as String?,
        content: data['content'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'source': source?.toMap(),
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt,
        'content': content,
      };

  ArticleEntity toEntity() => ArticleEntity(
        author: author,
        title: title,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
      );
}
