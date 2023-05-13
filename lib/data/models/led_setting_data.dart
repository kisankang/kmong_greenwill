import 'package:json_annotation/json_annotation.dart';

part 'led_setting_data.g.dart';

@JsonSerializable()
class LedSettingData {
  bool isAuto;
  bool isOn;
  DateTime startTime;
  DateTime endTime;
  double brightness;

  LedSettingData({
    required this.isAuto,
    required this.isOn,
    required this.startTime,
    required this.endTime,
    required this.brightness,
  });

  factory LedSettingData.fromJson(Map<String, dynamic> json) =>
      _$LedSettingDataFromJson(json);
  Map<String, dynamic> toJson() => _$LedSettingDataToJson(this);
}
