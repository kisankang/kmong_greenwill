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
      wrokingTIme: DateTime.parse(json['wrokingTIme'] as String),
    );

Map<String, dynamic> _$MotorSettingDataToJson(MotorSettingData instance) =>
    <String, dynamic>{
      'isAuto': instance.isAuto,
      'isOn': instance.isOn,
      'periodTime': instance.periodTime.toIso8601String(),
      'wrokingTIme': instance.wrokingTIme.toIso8601String(),
    };
