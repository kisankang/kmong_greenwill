import 'package:greenwillmanager/utils/parse_time.dart';
import 'package:json_annotation/json_annotation.dart';

part 'motor_setting_data.g.dart';

@JsonSerializable()
class MotorSettingData {
  bool isAuto;
  bool isOn;
  DateTime periodTime;
  DateTime workingTime;
  int isWrite;

  MotorSettingData(
      {required this.isAuto,
      required this.isOn,
      required this.periodTime,
      required this.workingTime,
      required this.isWrite});

  factory MotorSettingData.fromJson(Map<String, dynamic> json) =>
      _$MotorSettingDataFromJson(json);
  Map<String, dynamic> toJson() => _$MotorSettingDataToJson(this);

  Map<String, dynamic> toRTDB() {
    Map<String, dynamic> json = _$MotorSettingDataToJson(this);
    json['workingTime'] = ParseTime.toRTDB(workingTime);
    json['periodTime'] = ParseTime.toRTDB(periodTime);
    return json;
  }

  static MotorSettingData fromRTDB(Map<String, dynamic> json) {
    json['workingTime'] =
        ParseTime.fromRTDB(json['workingTime']).toIso8601String();
    json['periodTime'] =
        ParseTime.fromRTDB(json['periodTime']).toIso8601String();
    MotorSettingData fromJson = _$MotorSettingDataFromJson(json);
    return fromJson;
  }
}
