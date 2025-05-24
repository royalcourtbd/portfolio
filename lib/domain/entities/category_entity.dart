import 'package:portfolio/core/base/base_entity.dart';

class CategoryEntity extends BaseEntity {
  final int id;
  final String lang;
  final String category;
  final int? duaCount;

  const CategoryEntity({
    required this.id,
    required this.lang,
    required this.category,
    this.duaCount,
  });

  @override
  List<Object?> get props => [id, lang, category, duaCount];
}
