enum LanguageType {
  bangla('bn', 'বাংলা (Bangla)'),
  english('en', 'English');

  final String code;
  final String displayName;

  const LanguageType(this.code, this.displayName);

  static LanguageType fromCode(String code) {
    return LanguageType.values.firstWhere(
      (type) => type.code == code,
      orElse: () => LanguageType.english,
    );
  }

  static LanguageType fromDisplayName(String displayName) {
    return LanguageType.values.firstWhere(
      (type) => type.displayName == displayName,
      orElse: () => LanguageType.english,
    );
  }
}
