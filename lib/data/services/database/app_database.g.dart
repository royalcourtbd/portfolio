// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DuaTableTable extends DuaTable
    with TableInfo<$DuaTableTable, DuaTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DuaTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _langMeta = const VerificationMeta('lang');
  @override
  late final GeneratedColumn<String> lang = GeneratedColumn<String>(
    'lang',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _surahIdMeta = const VerificationMeta(
    'surahId',
  );
  @override
  late final GeneratedColumn<int> surahId = GeneratedColumn<int>(
    'surah_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ayahIdMeta = const VerificationMeta('ayahId');
  @override
  late final GeneratedColumn<String> ayahId = GeneratedColumn<String>(
    'ayah_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _uthmaniMeta = const VerificationMeta(
    'uthmani',
  );
  @override
  late final GeneratedColumn<String> uthmani = GeneratedColumn<String>(
    'uthmani',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _indopakMeta = const VerificationMeta(
    'indopak',
  );
  @override
  late final GeneratedColumn<String> indopak = GeneratedColumn<String>(
    'indopak',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _translationMeta = const VerificationMeta(
    'translation',
  );
  @override
  late final GeneratedColumn<String> translation = GeneratedColumn<String>(
    'translation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
    'reference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _audioMeta = const VerificationMeta('audio');
  @override
  late final GeneratedColumn<String> audio = GeneratedColumn<String>(
    'audio',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lang,
    categoryId,
    surahId,
    ayahId,
    name,
    uthmani,
    indopak,
    translation,
    reference,
    audio,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'duas';
  @override
  VerificationContext validateIntegrity(
    Insertable<DuaTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lang')) {
      context.handle(
        _langMeta,
        lang.isAcceptableOrUnknown(data['lang']!, _langMeta),
      );
    } else if (isInserting) {
      context.missing(_langMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('surah_id')) {
      context.handle(
        _surahIdMeta,
        surahId.isAcceptableOrUnknown(data['surah_id']!, _surahIdMeta),
      );
    } else if (isInserting) {
      context.missing(_surahIdMeta);
    }
    if (data.containsKey('ayah_id')) {
      context.handle(
        _ayahIdMeta,
        ayahId.isAcceptableOrUnknown(data['ayah_id']!, _ayahIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('uthmani')) {
      context.handle(
        _uthmaniMeta,
        uthmani.isAcceptableOrUnknown(data['uthmani']!, _uthmaniMeta),
      );
    } else if (isInserting) {
      context.missing(_uthmaniMeta);
    }
    if (data.containsKey('indopak')) {
      context.handle(
        _indopakMeta,
        indopak.isAcceptableOrUnknown(data['indopak']!, _indopakMeta),
      );
    } else if (isInserting) {
      context.missing(_indopakMeta);
    }
    if (data.containsKey('translation')) {
      context.handle(
        _translationMeta,
        translation.isAcceptableOrUnknown(
          data['translation']!,
          _translationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_translationMeta);
    }
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    } else if (isInserting) {
      context.missing(_referenceMeta);
    }
    if (data.containsKey('audio')) {
      context.handle(
        _audioMeta,
        audio.isAcceptableOrUnknown(data['audio']!, _audioMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DuaTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DuaTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      lang:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}lang'],
          )!,
      categoryId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}category_id'],
          )!,
      surahId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}surah_id'],
          )!,
      ayahId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ayah_id'],
      ),
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      uthmani:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}uthmani'],
          )!,
      indopak:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}indopak'],
          )!,
      translation:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}translation'],
          )!,
      reference:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}reference'],
          )!,
      audio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio'],
      ),
    );
  }

  @override
  $DuaTableTable createAlias(String alias) {
    return $DuaTableTable(attachedDatabase, alias);
  }
}

class DuaTableData extends DataClass implements Insertable<DuaTableData> {
  final int id;
  final String lang;
  final int categoryId;
  final int surahId;
  final String? ayahId;
  final String name;
  final String uthmani;
  final String indopak;
  final String translation;
  final String reference;
  final String? audio;
  const DuaTableData({
    required this.id,
    required this.lang,
    required this.categoryId,
    required this.surahId,
    this.ayahId,
    required this.name,
    required this.uthmani,
    required this.indopak,
    required this.translation,
    required this.reference,
    this.audio,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['lang'] = Variable<String>(lang);
    map['category_id'] = Variable<int>(categoryId);
    map['surah_id'] = Variable<int>(surahId);
    if (!nullToAbsent || ayahId != null) {
      map['ayah_id'] = Variable<String>(ayahId);
    }
    map['name'] = Variable<String>(name);
    map['uthmani'] = Variable<String>(uthmani);
    map['indopak'] = Variable<String>(indopak);
    map['translation'] = Variable<String>(translation);
    map['reference'] = Variable<String>(reference);
    if (!nullToAbsent || audio != null) {
      map['audio'] = Variable<String>(audio);
    }
    return map;
  }

  DuaTableCompanion toCompanion(bool nullToAbsent) {
    return DuaTableCompanion(
      id: Value(id),
      lang: Value(lang),
      categoryId: Value(categoryId),
      surahId: Value(surahId),
      ayahId:
          ayahId == null && nullToAbsent ? const Value.absent() : Value(ayahId),
      name: Value(name),
      uthmani: Value(uthmani),
      indopak: Value(indopak),
      translation: Value(translation),
      reference: Value(reference),
      audio:
          audio == null && nullToAbsent ? const Value.absent() : Value(audio),
    );
  }

  factory DuaTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DuaTableData(
      id: serializer.fromJson<int>(json['id']),
      lang: serializer.fromJson<String>(json['lang']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      surahId: serializer.fromJson<int>(json['surahId']),
      ayahId: serializer.fromJson<String?>(json['ayahId']),
      name: serializer.fromJson<String>(json['name']),
      uthmani: serializer.fromJson<String>(json['uthmani']),
      indopak: serializer.fromJson<String>(json['indopak']),
      translation: serializer.fromJson<String>(json['translation']),
      reference: serializer.fromJson<String>(json['reference']),
      audio: serializer.fromJson<String?>(json['audio']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lang': serializer.toJson<String>(lang),
      'categoryId': serializer.toJson<int>(categoryId),
      'surahId': serializer.toJson<int>(surahId),
      'ayahId': serializer.toJson<String?>(ayahId),
      'name': serializer.toJson<String>(name),
      'uthmani': serializer.toJson<String>(uthmani),
      'indopak': serializer.toJson<String>(indopak),
      'translation': serializer.toJson<String>(translation),
      'reference': serializer.toJson<String>(reference),
      'audio': serializer.toJson<String?>(audio),
    };
  }

  DuaTableData copyWith({
    int? id,
    String? lang,
    int? categoryId,
    int? surahId,
    Value<String?> ayahId = const Value.absent(),
    String? name,
    String? uthmani,
    String? indopak,
    String? translation,
    String? reference,
    Value<String?> audio = const Value.absent(),
  }) => DuaTableData(
    id: id ?? this.id,
    lang: lang ?? this.lang,
    categoryId: categoryId ?? this.categoryId,
    surahId: surahId ?? this.surahId,
    ayahId: ayahId.present ? ayahId.value : this.ayahId,
    name: name ?? this.name,
    uthmani: uthmani ?? this.uthmani,
    indopak: indopak ?? this.indopak,
    translation: translation ?? this.translation,
    reference: reference ?? this.reference,
    audio: audio.present ? audio.value : this.audio,
  );
  DuaTableData copyWithCompanion(DuaTableCompanion data) {
    return DuaTableData(
      id: data.id.present ? data.id.value : this.id,
      lang: data.lang.present ? data.lang.value : this.lang,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      surahId: data.surahId.present ? data.surahId.value : this.surahId,
      ayahId: data.ayahId.present ? data.ayahId.value : this.ayahId,
      name: data.name.present ? data.name.value : this.name,
      uthmani: data.uthmani.present ? data.uthmani.value : this.uthmani,
      indopak: data.indopak.present ? data.indopak.value : this.indopak,
      translation:
          data.translation.present ? data.translation.value : this.translation,
      reference: data.reference.present ? data.reference.value : this.reference,
      audio: data.audio.present ? data.audio.value : this.audio,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DuaTableData(')
          ..write('id: $id, ')
          ..write('lang: $lang, ')
          ..write('categoryId: $categoryId, ')
          ..write('surahId: $surahId, ')
          ..write('ayahId: $ayahId, ')
          ..write('name: $name, ')
          ..write('uthmani: $uthmani, ')
          ..write('indopak: $indopak, ')
          ..write('translation: $translation, ')
          ..write('reference: $reference, ')
          ..write('audio: $audio')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    lang,
    categoryId,
    surahId,
    ayahId,
    name,
    uthmani,
    indopak,
    translation,
    reference,
    audio,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DuaTableData &&
          other.id == this.id &&
          other.lang == this.lang &&
          other.categoryId == this.categoryId &&
          other.surahId == this.surahId &&
          other.ayahId == this.ayahId &&
          other.name == this.name &&
          other.uthmani == this.uthmani &&
          other.indopak == this.indopak &&
          other.translation == this.translation &&
          other.reference == this.reference &&
          other.audio == this.audio);
}

class DuaTableCompanion extends UpdateCompanion<DuaTableData> {
  final Value<int> id;
  final Value<String> lang;
  final Value<int> categoryId;
  final Value<int> surahId;
  final Value<String?> ayahId;
  final Value<String> name;
  final Value<String> uthmani;
  final Value<String> indopak;
  final Value<String> translation;
  final Value<String> reference;
  final Value<String?> audio;
  const DuaTableCompanion({
    this.id = const Value.absent(),
    this.lang = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.surahId = const Value.absent(),
    this.ayahId = const Value.absent(),
    this.name = const Value.absent(),
    this.uthmani = const Value.absent(),
    this.indopak = const Value.absent(),
    this.translation = const Value.absent(),
    this.reference = const Value.absent(),
    this.audio = const Value.absent(),
  });
  DuaTableCompanion.insert({
    this.id = const Value.absent(),
    required String lang,
    required int categoryId,
    required int surahId,
    this.ayahId = const Value.absent(),
    required String name,
    required String uthmani,
    required String indopak,
    required String translation,
    required String reference,
    this.audio = const Value.absent(),
  }) : lang = Value(lang),
       categoryId = Value(categoryId),
       surahId = Value(surahId),
       name = Value(name),
       uthmani = Value(uthmani),
       indopak = Value(indopak),
       translation = Value(translation),
       reference = Value(reference);
  static Insertable<DuaTableData> custom({
    Expression<int>? id,
    Expression<String>? lang,
    Expression<int>? categoryId,
    Expression<int>? surahId,
    Expression<String>? ayahId,
    Expression<String>? name,
    Expression<String>? uthmani,
    Expression<String>? indopak,
    Expression<String>? translation,
    Expression<String>? reference,
    Expression<String>? audio,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lang != null) 'lang': lang,
      if (categoryId != null) 'category_id': categoryId,
      if (surahId != null) 'surah_id': surahId,
      if (ayahId != null) 'ayah_id': ayahId,
      if (name != null) 'name': name,
      if (uthmani != null) 'uthmani': uthmani,
      if (indopak != null) 'indopak': indopak,
      if (translation != null) 'translation': translation,
      if (reference != null) 'reference': reference,
      if (audio != null) 'audio': audio,
    });
  }

  DuaTableCompanion copyWith({
    Value<int>? id,
    Value<String>? lang,
    Value<int>? categoryId,
    Value<int>? surahId,
    Value<String?>? ayahId,
    Value<String>? name,
    Value<String>? uthmani,
    Value<String>? indopak,
    Value<String>? translation,
    Value<String>? reference,
    Value<String?>? audio,
  }) {
    return DuaTableCompanion(
      id: id ?? this.id,
      lang: lang ?? this.lang,
      categoryId: categoryId ?? this.categoryId,
      surahId: surahId ?? this.surahId,
      ayahId: ayahId ?? this.ayahId,
      name: name ?? this.name,
      uthmani: uthmani ?? this.uthmani,
      indopak: indopak ?? this.indopak,
      translation: translation ?? this.translation,
      reference: reference ?? this.reference,
      audio: audio ?? this.audio,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lang.present) {
      map['lang'] = Variable<String>(lang.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (surahId.present) {
      map['surah_id'] = Variable<int>(surahId.value);
    }
    if (ayahId.present) {
      map['ayah_id'] = Variable<String>(ayahId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (uthmani.present) {
      map['uthmani'] = Variable<String>(uthmani.value);
    }
    if (indopak.present) {
      map['indopak'] = Variable<String>(indopak.value);
    }
    if (translation.present) {
      map['translation'] = Variable<String>(translation.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (audio.present) {
      map['audio'] = Variable<String>(audio.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DuaTableCompanion(')
          ..write('id: $id, ')
          ..write('lang: $lang, ')
          ..write('categoryId: $categoryId, ')
          ..write('surahId: $surahId, ')
          ..write('ayahId: $ayahId, ')
          ..write('name: $name, ')
          ..write('uthmani: $uthmani, ')
          ..write('indopak: $indopak, ')
          ..write('translation: $translation, ')
          ..write('reference: $reference, ')
          ..write('audio: $audio')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTableTable extends CategoriesTable
    with TableInfo<$CategoriesTableTable, CategoriesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _langMeta = const VerificationMeta('lang');
  @override
  late final GeneratedColumn<String> lang = GeneratedColumn<String>(
    'lang',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _duaCountMeta = const VerificationMeta(
    'duaCount',
  );
  @override
  late final GeneratedColumn<int> duaCount = GeneratedColumn<int>(
    'dua_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, lang, category, duaCount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoriesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lang')) {
      context.handle(
        _langMeta,
        lang.isAcceptableOrUnknown(data['lang']!, _langMeta),
      );
    } else if (isInserting) {
      context.missing(_langMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('dua_count')) {
      context.handle(
        _duaCountMeta,
        duaCount.isAcceptableOrUnknown(data['dua_count']!, _duaCountMeta),
      );
    } else if (isInserting) {
      context.missing(_duaCountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoriesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoriesTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      lang:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}lang'],
          )!,
      category:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}category'],
          )!,
      duaCount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}dua_count'],
          )!,
    );
  }

  @override
  $CategoriesTableTable createAlias(String alias) {
    return $CategoriesTableTable(attachedDatabase, alias);
  }
}

class CategoriesTableData extends DataClass
    implements Insertable<CategoriesTableData> {
  final int id;
  final String lang;
  final String category;
  final int duaCount;
  const CategoriesTableData({
    required this.id,
    required this.lang,
    required this.category,
    required this.duaCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['lang'] = Variable<String>(lang);
    map['category'] = Variable<String>(category);
    map['dua_count'] = Variable<int>(duaCount);
    return map;
  }

  CategoriesTableCompanion toCompanion(bool nullToAbsent) {
    return CategoriesTableCompanion(
      id: Value(id),
      lang: Value(lang),
      category: Value(category),
      duaCount: Value(duaCount),
    );
  }

  factory CategoriesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoriesTableData(
      id: serializer.fromJson<int>(json['id']),
      lang: serializer.fromJson<String>(json['lang']),
      category: serializer.fromJson<String>(json['category']),
      duaCount: serializer.fromJson<int>(json['duaCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lang': serializer.toJson<String>(lang),
      'category': serializer.toJson<String>(category),
      'duaCount': serializer.toJson<int>(duaCount),
    };
  }

  CategoriesTableData copyWith({
    int? id,
    String? lang,
    String? category,
    int? duaCount,
  }) => CategoriesTableData(
    id: id ?? this.id,
    lang: lang ?? this.lang,
    category: category ?? this.category,
    duaCount: duaCount ?? this.duaCount,
  );
  CategoriesTableData copyWithCompanion(CategoriesTableCompanion data) {
    return CategoriesTableData(
      id: data.id.present ? data.id.value : this.id,
      lang: data.lang.present ? data.lang.value : this.lang,
      category: data.category.present ? data.category.value : this.category,
      duaCount: data.duaCount.present ? data.duaCount.value : this.duaCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesTableData(')
          ..write('id: $id, ')
          ..write('lang: $lang, ')
          ..write('category: $category, ')
          ..write('duaCount: $duaCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, lang, category, duaCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoriesTableData &&
          other.id == this.id &&
          other.lang == this.lang &&
          other.category == this.category &&
          other.duaCount == this.duaCount);
}

class CategoriesTableCompanion extends UpdateCompanion<CategoriesTableData> {
  final Value<int> id;
  final Value<String> lang;
  final Value<String> category;
  final Value<int> duaCount;
  const CategoriesTableCompanion({
    this.id = const Value.absent(),
    this.lang = const Value.absent(),
    this.category = const Value.absent(),
    this.duaCount = const Value.absent(),
  });
  CategoriesTableCompanion.insert({
    this.id = const Value.absent(),
    required String lang,
    required String category,
    required int duaCount,
  }) : lang = Value(lang),
       category = Value(category),
       duaCount = Value(duaCount);
  static Insertable<CategoriesTableData> custom({
    Expression<int>? id,
    Expression<String>? lang,
    Expression<String>? category,
    Expression<int>? duaCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lang != null) 'lang': lang,
      if (category != null) 'category': category,
      if (duaCount != null) 'dua_count': duaCount,
    });
  }

  CategoriesTableCompanion copyWith({
    Value<int>? id,
    Value<String>? lang,
    Value<String>? category,
    Value<int>? duaCount,
  }) {
    return CategoriesTableCompanion(
      id: id ?? this.id,
      lang: lang ?? this.lang,
      category: category ?? this.category,
      duaCount: duaCount ?? this.duaCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lang.present) {
      map['lang'] = Variable<String>(lang.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (duaCount.present) {
      map['dua_count'] = Variable<int>(duaCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesTableCompanion(')
          ..write('id: $id, ')
          ..write('lang: $lang, ')
          ..write('category: $category, ')
          ..write('duaCount: $duaCount')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DuaTableTable duaTable = $DuaTableTable(this);
  late final $CategoriesTableTable categoriesTable = $CategoriesTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    duaTable,
    categoriesTable,
  ];
}

typedef $$DuaTableTableCreateCompanionBuilder =
    DuaTableCompanion Function({
      Value<int> id,
      required String lang,
      required int categoryId,
      required int surahId,
      Value<String?> ayahId,
      required String name,
      required String uthmani,
      required String indopak,
      required String translation,
      required String reference,
      Value<String?> audio,
    });
typedef $$DuaTableTableUpdateCompanionBuilder =
    DuaTableCompanion Function({
      Value<int> id,
      Value<String> lang,
      Value<int> categoryId,
      Value<int> surahId,
      Value<String?> ayahId,
      Value<String> name,
      Value<String> uthmani,
      Value<String> indopak,
      Value<String> translation,
      Value<String> reference,
      Value<String?> audio,
    });

class $$DuaTableTableFilterComposer
    extends Composer<_$AppDatabase, $DuaTableTable> {
  $$DuaTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lang => $composableBuilder(
    column: $table.lang,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get surahId => $composableBuilder(
    column: $table.surahId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ayahId => $composableBuilder(
    column: $table.ayahId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uthmani => $composableBuilder(
    column: $table.uthmani,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get indopak => $composableBuilder(
    column: $table.indopak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get translation => $composableBuilder(
    column: $table.translation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get audio => $composableBuilder(
    column: $table.audio,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DuaTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DuaTableTable> {
  $$DuaTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lang => $composableBuilder(
    column: $table.lang,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get surahId => $composableBuilder(
    column: $table.surahId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ayahId => $composableBuilder(
    column: $table.ayahId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uthmani => $composableBuilder(
    column: $table.uthmani,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get indopak => $composableBuilder(
    column: $table.indopak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get translation => $composableBuilder(
    column: $table.translation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get audio => $composableBuilder(
    column: $table.audio,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DuaTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DuaTableTable> {
  $$DuaTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get lang =>
      $composableBuilder(column: $table.lang, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get surahId =>
      $composableBuilder(column: $table.surahId, builder: (column) => column);

  GeneratedColumn<String> get ayahId =>
      $composableBuilder(column: $table.ayahId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get uthmani =>
      $composableBuilder(column: $table.uthmani, builder: (column) => column);

  GeneratedColumn<String> get indopak =>
      $composableBuilder(column: $table.indopak, builder: (column) => column);

  GeneratedColumn<String> get translation => $composableBuilder(
    column: $table.translation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<String> get audio =>
      $composableBuilder(column: $table.audio, builder: (column) => column);
}

class $$DuaTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DuaTableTable,
          DuaTableData,
          $$DuaTableTableFilterComposer,
          $$DuaTableTableOrderingComposer,
          $$DuaTableTableAnnotationComposer,
          $$DuaTableTableCreateCompanionBuilder,
          $$DuaTableTableUpdateCompanionBuilder,
          (
            DuaTableData,
            BaseReferences<_$AppDatabase, $DuaTableTable, DuaTableData>,
          ),
          DuaTableData,
          PrefetchHooks Function()
        > {
  $$DuaTableTableTableManager(_$AppDatabase db, $DuaTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$DuaTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$DuaTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$DuaTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> lang = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<int> surahId = const Value.absent(),
                Value<String?> ayahId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> uthmani = const Value.absent(),
                Value<String> indopak = const Value.absent(),
                Value<String> translation = const Value.absent(),
                Value<String> reference = const Value.absent(),
                Value<String?> audio = const Value.absent(),
              }) => DuaTableCompanion(
                id: id,
                lang: lang,
                categoryId: categoryId,
                surahId: surahId,
                ayahId: ayahId,
                name: name,
                uthmani: uthmani,
                indopak: indopak,
                translation: translation,
                reference: reference,
                audio: audio,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String lang,
                required int categoryId,
                required int surahId,
                Value<String?> ayahId = const Value.absent(),
                required String name,
                required String uthmani,
                required String indopak,
                required String translation,
                required String reference,
                Value<String?> audio = const Value.absent(),
              }) => DuaTableCompanion.insert(
                id: id,
                lang: lang,
                categoryId: categoryId,
                surahId: surahId,
                ayahId: ayahId,
                name: name,
                uthmani: uthmani,
                indopak: indopak,
                translation: translation,
                reference: reference,
                audio: audio,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DuaTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DuaTableTable,
      DuaTableData,
      $$DuaTableTableFilterComposer,
      $$DuaTableTableOrderingComposer,
      $$DuaTableTableAnnotationComposer,
      $$DuaTableTableCreateCompanionBuilder,
      $$DuaTableTableUpdateCompanionBuilder,
      (
        DuaTableData,
        BaseReferences<_$AppDatabase, $DuaTableTable, DuaTableData>,
      ),
      DuaTableData,
      PrefetchHooks Function()
    >;
typedef $$CategoriesTableTableCreateCompanionBuilder =
    CategoriesTableCompanion Function({
      Value<int> id,
      required String lang,
      required String category,
      required int duaCount,
    });
typedef $$CategoriesTableTableUpdateCompanionBuilder =
    CategoriesTableCompanion Function({
      Value<int> id,
      Value<String> lang,
      Value<String> category,
      Value<int> duaCount,
    });

class $$CategoriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTableTable> {
  $$CategoriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lang => $composableBuilder(
    column: $table.lang,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duaCount => $composableBuilder(
    column: $table.duaCount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTableTable> {
  $$CategoriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lang => $composableBuilder(
    column: $table.lang,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duaCount => $composableBuilder(
    column: $table.duaCount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTableTable> {
  $$CategoriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get lang =>
      $composableBuilder(column: $table.lang, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get duaCount =>
      $composableBuilder(column: $table.duaCount, builder: (column) => column);
}

class $$CategoriesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTableTable,
          CategoriesTableData,
          $$CategoriesTableTableFilterComposer,
          $$CategoriesTableTableOrderingComposer,
          $$CategoriesTableTableAnnotationComposer,
          $$CategoriesTableTableCreateCompanionBuilder,
          $$CategoriesTableTableUpdateCompanionBuilder,
          (
            CategoriesTableData,
            BaseReferences<
              _$AppDatabase,
              $CategoriesTableTable,
              CategoriesTableData
            >,
          ),
          CategoriesTableData,
          PrefetchHooks Function()
        > {
  $$CategoriesTableTableTableManager(
    _$AppDatabase db,
    $CategoriesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$CategoriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CategoriesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$CategoriesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> lang = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<int> duaCount = const Value.absent(),
              }) => CategoriesTableCompanion(
                id: id,
                lang: lang,
                category: category,
                duaCount: duaCount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String lang,
                required String category,
                required int duaCount,
              }) => CategoriesTableCompanion.insert(
                id: id,
                lang: lang,
                category: category,
                duaCount: duaCount,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTableTable,
      CategoriesTableData,
      $$CategoriesTableTableFilterComposer,
      $$CategoriesTableTableOrderingComposer,
      $$CategoriesTableTableAnnotationComposer,
      $$CategoriesTableTableCreateCompanionBuilder,
      $$CategoriesTableTableUpdateCompanionBuilder,
      (
        CategoriesTableData,
        BaseReferences<
          _$AppDatabase,
          $CategoriesTableTable,
          CategoriesTableData
        >,
      ),
      CategoriesTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DuaTableTableTableManager get duaTable =>
      $$DuaTableTableTableManager(_db, _db.duaTable);
  $$CategoriesTableTableTableManager get categoriesTable =>
      $$CategoriesTableTableTableManager(_db, _db.categoriesTable);
}
