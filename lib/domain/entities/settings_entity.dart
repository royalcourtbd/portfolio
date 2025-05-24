import 'package:portfolio/core/base/base_entity.dart';
import 'package:flutter/material.dart';

class SettingsEntity extends BaseEntity {
  final String currentLanguage;
  final bool darkMode;
  final double arabicFontSize;
  final double translationFontSize;
  final bool enableNotifications;
  final TimeOfDay? notificationTime;
  final bool showArabicText;
  final bool showTranslation;
  final bool showReference;

  const SettingsEntity({
    required this.currentLanguage,
    required this.darkMode,
    required this.arabicFontSize,
    required this.translationFontSize,
    required this.enableNotifications,
    required this.notificationTime,
    required this.showArabicText,
    required this.showTranslation,
    required this.showReference,
  });

  factory SettingsEntity.empty() {
    return SettingsEntity(
      currentLanguage: 'English',
      darkMode: false,
      arabicFontSize: 15,
      translationFontSize: 16.0,
      enableNotifications: false,
      notificationTime: null,
      showArabicText: true,
      showTranslation: true,
      showReference: true,
    );
  }

  @override
  List<Object?> get props => [
    currentLanguage,
    darkMode,
    arabicFontSize,
    translationFontSize,
    enableNotifications,
    notificationTime,
    showArabicText,
    showTranslation,
    showReference,
  ];

  SettingsEntity copyWith({
    String? language,
    bool? darkMode,
    double? arabicFontSize,
    double? translationFontSize,
    bool? enableNotifications,
    TimeOfDay? notificationTime,
    bool? showArabicText,
    bool? showTranslation,
    bool? showReference,
  }) {
    return SettingsEntity(
      currentLanguage: language ?? currentLanguage,
      darkMode: darkMode ?? this.darkMode,
      arabicFontSize: arabicFontSize ?? this.arabicFontSize,
      translationFontSize: translationFontSize ?? this.translationFontSize,
      enableNotifications: enableNotifications ?? this.enableNotifications,
      showArabicText: showArabicText ?? this.showArabicText,
      showTranslation: showTranslation ?? this.showTranslation,
      showReference: showReference ?? this.showReference,
      notificationTime: notificationTime ?? this.notificationTime,
    );
  }
}
