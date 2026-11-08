import 'package:news_app/features/news/domain/entity/source_entity.dart';

class SourcesResponseModel {
  final String? status;
  final List<SourceModel>? sources;

  const SourcesResponseModel({this.status, this.sources});

  factory SourcesResponseModel.fromMap(Map<String, dynamic> data) =>
      SourcesResponseModel(
        status: data['status'] as String?,
        sources: (data['sources'] as List<dynamic>?)
            ?.map((e) => SourceModel.fromMap(e as Map<String, dynamic>))
            .toList(),
      );
}

class SourceModel {
  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;

  const SourceModel({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory SourceModel.fromMap(Map<String, dynamic> data) => SourceModel(
        id: data['id'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        url: data['url'] as String?,
        category: data['category'] as String?,
        language: data['language'] as String?,
        country: data['country'] as String?,
      );

  SourceEntity toEntity() => SourceEntity(id: id ?? '', name: name ?? '');
}
