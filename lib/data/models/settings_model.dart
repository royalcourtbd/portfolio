import 'package:portfolio/domain/entities/settings_entity.dart';
import 'package:flutter/material.dart';

class SettingsModel extends SettingsEntity {
  const SettingsModel({
    required super.currentLanguage,
    required super.darkMode,
    required super.arabicFontSize,
    required super.translationFontSize,
    required super.enableNotifications,
    required super.notificationTime,
    required super.showArabicText,
    required super.showTranslation,
    required super.showReference,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    TimeOfDay? notificationTime;

    // TimeOfDay অবজেক্ট চেক
    if (json['notification_time'] is TimeOfDay) {
      notificationTime = json['notification_time'] as TimeOfDay;
    }
    // পৃথক hour/minute ফিল্ড চেক
    else if (json.containsKey('notification_time_hour') &&
        json.containsKey('notification_time_minute')) {
      notificationTime = TimeOfDay(
        hour: json['notification_time_hour'] as int,
        minute: json['notification_time_minute'] as int,
      );
    }

    return SettingsModel(
      currentLanguage: json['currentLanguage'] as String,
      darkMode: json['dark_mode'] as bool,
      arabicFontSize: (json['arabic_font_size'] as num).toDouble(),
      translationFontSize: (json['translation_font_size'] as num).toDouble(),
      enableNotifications: json['enable_notifications'] as bool,
      notificationTime: notificationTime,
      showArabicText: json['show_arabic_text'] as bool,
      showTranslation: json['show_translation'] as bool,
      showReference: json['show_reference'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      'currentLanguage': currentLanguage,
      'dark_mode': darkMode,
      'arabic_font_size': arabicFontSize,
      'translation_font_size': translationFontSize,
      'enable_notifications': enableNotifications,
      'show_arabic_text': showArabicText,
      'show_translation': showTranslation,
      'show_reference': showReference,
    };

    // TimeOfDay সিরিয়ালাইজেশন হ্যান্ডলিং
    if (notificationTime != null) {
      json['notification_time_hour'] = notificationTime!.hour;
      json['notification_time_minute'] = notificationTime!.minute;
    }

    return json;
  }
}
