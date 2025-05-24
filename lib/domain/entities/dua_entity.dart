import 'package:portfolio/core/base/base_entity.dart';

class DuaEntity extends BaseEntity {
  final int id;
  final String lang;
  final int categoryId;
  final int? surahId;
  final String? ayahId;
  final String name;
  final String? uthmani;
  final String? indopak;
  final String translation;
  final String? reference;
  final String? audio;

  const DuaEntity({
    required this.id,
    required this.lang,
    required this.categoryId,
    this.surahId,
    this.ayahId,
    required this.name,
    required this.translation,
    this.reference,
    this.uthmani,
    this.indopak,
    this.audio,
  });

  @override
  List<Object?> get props => [
    id,
    lang,
    name,
    translation,
    reference,
    categoryId,
    surahId,
    ayahId,
    uthmani,
    indopak,
    audio,
  ];
}
