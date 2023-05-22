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

  Map<String, dynamic> toJsonForRTDB() {
    Map<String, dynamic> json = _$MotorSettingDataToJson(this);
    json['workingTime'] = ParseTime.forRTDB(workingTime);
    json['periodTime'] = ParseTime.forRTDB(periodTime);
    return json;
  }
}
