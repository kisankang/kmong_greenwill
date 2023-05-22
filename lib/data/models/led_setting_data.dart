import 'package:greenwillmanager/utils/parse_time.dart';
import 'package:json_annotation/json_annotation.dart';

part 'led_setting_data.g.dart';

@JsonSerializable()
class LedSettingData {
  bool isAuto;
  bool isOn;
  DateTime startTime;
  DateTime endTime;
  double brightness;
  int isWrite;

  LedSettingData({
    required this.isAuto,
    required this.isOn,
    required this.startTime,
    required this.endTime,
    required this.brightness,
    required this.isWrite,
  });

  factory LedSettingData.fromJson(Map<String, dynamic> json) =>
      _$LedSettingDataFromJson(json);
  Map<String, dynamic> toJson() => _$LedSettingDataToJson(this);

  Map<String, dynamic> toJsonForRTDB() {
    Map<String, dynamic> json = _$LedSettingDataToJson(this);
    json['startTime'] = ParseTime.forRTDB(startTime);
    json['endTime'] = ParseTime.forRTDB(endTime);
    return json;
  }
}
