import 'package:portfolio/domain/entities/dua_entity.dart';

class DuaModel extends DuaEntity {
  const DuaModel({
    required super.id,
    required super.lang,
    required super.categoryId,
    super.surahId,
    super.ayahId,
    required super.name,
    super.uthmani,
    super.indopak,
    required super.translation,
    super.reference,
    super.audio,
  });

  factory DuaModel.fromJson(Map<String, dynamic> json) {
    return DuaModel(
      id: json['id'] as int,
      lang: json['lang'] as String,
      categoryId: json['category_id'] as int,
      surahId: json['surah_id'] as int?,
      ayahId: json['ayah_id'] as String?,
      name: json['name'] as String,
      uthmani: json['uthmani'] as String?,
      indopak: json['indopak'] as String?,
      translation: json['translation'] as String,
      reference: json['reference'] as String?,
      audio: json['audio'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lang': lang,
      'category_id': categoryId,
      'surah_id': surahId,
      'ayah_id': ayahId,
      'name': name,
      'uthmani': uthmani,
      'indopak': indopak,
      'translation': translation,
      'reference': reference,
      'audio': audio,
    };
  }
}
