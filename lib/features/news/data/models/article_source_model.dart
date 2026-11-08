class ArticleSourceModel {
  final String? id;
  final String? name;

  const ArticleSourceModel({this.id, this.name});

  factory ArticleSourceModel.fromMap(Map<String, dynamic> data) =>
      ArticleSourceModel(
        id: data['id'] as String?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {'id': id, 'name': name};
}
