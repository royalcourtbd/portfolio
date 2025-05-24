import 'package:portfolio/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.lang,
    required super.category,
    super.duaCount,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      lang: json['lang'] as String,
      category: json['category'] as String,
      duaCount: json['dua_count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lang': lang,
      'category': category,
      'dua_count': duaCount,
    };
  }
}
