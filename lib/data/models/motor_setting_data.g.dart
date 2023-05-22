// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motor_setting_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MotorSettingData _$MotorSettingDataFromJson(Map<String, dynamic> json) =>
    MotorSettingData(
      isAuto: json['isAuto'] as bool,
      isOn: json['isOn'] as bool,
      periodTime: DateTime.parse(json['periodTime'] as String),
      workingTime: DateTime.parse(json['workingTime'] as String),
      isWrite: json['isWrite'] as int,
    );

Map<String, dynamic> _$MotorSettingDataToJson(MotorSettingData instance) =>
    <String, dynamic>{
      'isAuto': instance.isAuto,
      'isOn': instance.isOn,
      'periodTime': instance.periodTime.toIso8601String(),
      'workingTime': instance.workingTime.toIso8601String(),
      'isWrite': instance.isWrite,
    };
