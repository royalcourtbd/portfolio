import 'dart:convert';

import 'package:portfolio/core/utility/logger_utility.dart';
import 'package:portfolio/data/models/settings_model.dart';
import 'package:portfolio/domain/entities/settings_entity.dart';
import 'package:flutter/material.dart';

/// সেটিংস এন্টিটি থেকে জেসন এবং জেসন থেকে সেটিংস এন্টিটি রূপান্তরের জন্য ম্যাপার
class SettingsEntityMapper {
  SettingsEntityMapper._();

  /// সেটিংস এন্টিটি থেকে জেসন স্ট্রিং এ রূপান্তর করে - compute ছাড়া
  static Future<String> entityToJson(SettingsEntity entity) async {
    final SettingsModel model = entityToModel(entity);

    return jsonEncode(model.toJson());
  }

  /// জেসন স্ট্রিং থেকে সেটিংস এন্টিটি তে রূপান্তর করে - compute ছাড়া
  static Future<SettingsEntity> jsonToEntity(String jsonString) async {
    try {
      final Map<String, dynamic> map = jsonDecode(jsonString);

      // TimeOfDay পুনরুদ্ধার
      TimeOfDay? notificationTime;
      if (map.containsKey('notification_time_hour') &&
          map.containsKey('notification_time_minute')) {
        notificationTime = TimeOfDay(
          hour: map['notification_time_hour'] as int,
          minute: map['notification_time_minute'] as int,
        );
        map['notification_time'] = notificationTime;
      }

      return SettingsModel.fromJson(map);
    } catch (e) {
      logErrorStatic('Error parsing settings JSON: $e', 'SettingsEntityMapper');
      return SettingsEntity.empty();
    }
  }

  /// সেটিংস এন্টিটি থেকে সেটিংস মডেলে রূপান্তর করে
  static SettingsModel entityToModel(SettingsEntity entity) {
    return SettingsModel(
      currentLanguage: entity.currentLanguage,
      darkMode: entity.darkMode,
      arabicFontSize: entity.arabicFontSize,
      translationFontSize: entity.translationFontSize,
      enableNotifications: entity.enableNotifications,
      notificationTime: entity.notificationTime,
      showArabicText: entity.showArabicText,
      showTranslation: entity.showTranslation,
      showReference: entity.showReference,
    );
  }
}
