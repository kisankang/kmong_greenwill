// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'led_setting_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LedSettingData _$LedSettingDataFromJson(Map<String, dynamic> json) =>
    LedSettingData(
      isAuto: json['isAuto'] as bool,
      isOn: json['isOn'] as bool,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      brightness: (json['brightness'] as num).toDouble(),
      isWrite: json['isWrite'] as int,
    );

Map<String, dynamic> _$LedSettingDataToJson(LedSettingData instance) =>
    <String, dynamic>{
      'isAuto': instance.isAuto,
      'isOn': instance.isOn,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'brightness': instance.brightness,
      'isWrite': instance.isWrite,
    };
