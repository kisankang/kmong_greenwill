import 'package:get/get.dart';
import 'package:greenwillmanager/data/models/led_setting_data.dart';
import 'package:greenwillmanager/data/models/motor_setting_data.dart';
import 'package:greenwillmanager/data/repositories/firebase_repository.dart';
import 'package:greenwillmanager/data/services/firebase_service.dart';
import 'package:greenwillmanager/data/services/local_service.dart';
import 'package:greenwillmanager/routes/app_pages.dart';
import 'package:greenwillmanager/utils/init_value.dart';

class MainController extends GetxController {
  FirebaseService _firebaseService;
  FirebaseRepository firebaseRepository;
  LocalService _localService;
  MainController(
      {required FirebaseService firebaseService,
      required this.firebaseRepository,
      required LocalService localService})
      : _firebaseService = firebaseService,
        _localService = localService;

  Rx<bool> isSettingMode = true.obs;
  Rx<bool> isLedSettingMode = true.obs;

  late Rx<LedSettingData> ledSettingData;
  late Rx<MotorSettingData> motorSettingData;

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
      val?.workingTime = t;
    });
  }

  onChangedLedBrightness(double value) {
    ledSettingData.update((val) {
      val?.brightness = value.roundToDouble();
    });
  }

  Map<String, dynamic>? sortMap(Map<String, dynamic>? mapData) {
    if (mapData != null) {
      List<MapEntry<String, dynamic>> listMappedEntries =
          mapData.entries.toList();

      listMappedEntries.sort((a, b) => b.key.compareTo(a.key));

      final Map<String, dynamic> sortedMapData =
          Map.fromEntries(listMappedEntries);

      return sortedMapData;
    } else {
      return null;
    }
  }

  _initSettingData() async {
    LedSettingData? led = await _firebaseService.getLedSetting();
    MotorSettingData? motor = await _firebaseService.getMotorSetting();
    if (led == null) {
      ledSettingData = Rx(InitialValue.ledSettingData);
      await _firebaseService.sendLedSetting(ledSettingData.value);
    } else {
      ledSettingData = Rx(led);
    }
    if (motor == null) {
      motorSettingData = Rx(InitialValue.motorSettingData);
      await _firebaseService.sendMotorSetting(motorSettingData.value);
    } else {
      motorSettingData = Rx(motor);
    }
  }

  Future<bool> init() async {
    await _initSettingData();
    return true;
  }

  onPressBackButton() async {
    await _localService.deleteId();
    Get.offAndToNamed(Routes.LOGIN);
  }
}
