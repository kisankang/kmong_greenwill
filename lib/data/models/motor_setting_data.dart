import 'package:json_annotation/json_annotation.dart';

part 'motor_setting_data.g.dart';

@JsonSerializable()
class MotorSettingData {
  bool isAuto;
  bool isOn;
  DateTime periodTime;
  DateTime wrokingTIme;

  MotorSettingData({
    required this.isAuto,
    required this.isOn,
    required this.periodTime,
    required this.wrokingTIme,
  });

  factory MotorSettingData.fromJson(Map<String, dynamic> json) =>
      _$MotorSettingDataFromJson(json);
  Map<String, dynamic> toJson() => _$MotorSettingDataToJson(this);
}
