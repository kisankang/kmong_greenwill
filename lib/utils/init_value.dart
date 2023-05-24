import 'package:greenwillmanager/data/models/led_setting_data.dart';
import 'package:greenwillmanager/data/models/motor_setting_data.dart';

class InitialValue {
  static LedSettingData ledSettingData = LedSettingData(
    isAuto: false,
    isOn: false,
    startTime: DateTime.now().copyWith(hour: 0, minute: 0),
    endTime: DateTime.now().copyWith(hour: 0, minute: 0),
    brightness: 50,
    isWrite: 1,
  );
  static MotorSettingData motorSettingData = MotorSettingData(
    isAuto: false,
    isOn: false,
    periodTime: DateTime.now().copyWith(hour: 0, minute: 0),
    workingTime: DateTime.now().copyWith(hour: 0, minute: 0),
    isWrite: 1,
  );
}
