import 'package:get/get.dart';
import 'package:greenwillmanager/data/models/led_setting_data.dart';
import 'package:greenwillmanager/data/models/motor_setting_data.dart';
import 'package:greenwillmanager/data/services/firebase_service.dart';

class MainController extends GetxController {
  FirebaseService _firebaseService;
  MainController({required FirebaseService firebaseService})
      : _firebaseService = firebaseService;

  late Map<String, dynamic> tempMapData;
  late Map<String, dynamic> humMapData;

  Rx<bool> isSettingMode = true.obs;
  Rx<bool> isLedSettingMode = true.obs;

  Rx<LedSettingData> ledSettingData = Rx(LedSettingData(
      isAuto: false,
      isOn: false,
      startTime: DateTime.now().copyWith(hour: 0, minute: 0),
      endTime: DateTime.now().copyWith(hour: 0, minute: 0),
      brightness: 50));

  Rx<MotorSettingData> motorSettingData = Rx(MotorSettingData(
    isAuto: false,
    isOn: false,
    periodTime: DateTime.now().copyWith(hour: 0, minute: 0),
    wrokingTIme: DateTime.now().copyWith(hour: 0, minute: 0),
  ));

  onTapSendButton() {
    isLedSettingMode.value
        ? _firebaseService.sendLedSetting(ledSettingData.value)
        : _firebaseService.sendMotorSetting(motorSettingData.value);
  }

  onChangedAutoRadio(bool? value) {
    isLedSettingMode.value
        ? ledSettingData.update((val) {
            val?.isAuto = value!;
          })
        : motorSettingData.update((val) {
            val?.isAuto = value!;
          });
  }

  onChangedManualRadio(bool? value) {
    isLedSettingMode.value
        ? ledSettingData.update((val) {
            val?.isAuto = value!;
          })
        : motorSettingData.update((val) {
            val?.isAuto = value!;
          });
  }

  onChangedManualOnRadio(bool? value) {
    isLedSettingMode.value
        ? ledSettingData.update((val) {
            val?.isOn = value!;
          })
        : motorSettingData.update((val) {
            val?.isOn = value!;
          });
  }

  onChangedManualOffRadio(bool? value) {
    isLedSettingMode.value
        ? ledSettingData.update((val) {
            val?.isOn = value!;
          })
        : motorSettingData.update((val) {
            val?.isOn = value!;
          });
  }

  onChangedLedStartPicker(DateTime t) {
    ledSettingData.update((val) {
      val?.startTime = t;
    });
  }

  onChangedLedEndPicker(DateTime t) {
    ledSettingData.update((val) {
      val?.endTime = t;
    });
  }

  onChangedMotorPeriodPicker(DateTime t) {
    motorSettingData.update((val) {
      val?.periodTime = t;
    });
  }

  onChangedMotorWorkingPicker(DateTime t) {
    motorSettingData.update((val) {
      val?.wrokingTIme = t;
    });
  }

  onChangedLedBrightness(double value) {
    ledSettingData.update((val) {
      val?.brightness = value.roundToDouble();
    });
  }

  Map<String, dynamic> _sortMap(Map<String, dynamic> mapData) {
    List<MapEntry<String, dynamic>> listMappedEntries =
        mapData.entries.toList();

    listMappedEntries.sort((a, b) => b.key.compareTo(a.key));

    final Map<String, dynamic> sortedMapData =
        Map.fromEntries(listMappedEntries);

    return sortedMapData;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    tempMapData = _sortMap(await _firebaseService.getTempData());
    humMapData = _sortMap(await _firebaseService.getHumData());
  }
}
