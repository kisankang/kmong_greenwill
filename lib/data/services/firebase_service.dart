import 'package:get/get.dart';
import 'package:greenwillmanager/data/models/led_setting_data.dart';
import 'package:greenwillmanager/data/models/motor_setting_data.dart';
import 'package:greenwillmanager/data/repositories/firebase_repository.dart';

class FirebaseService extends GetxService {
  final FirebaseRepository _firebaseRepository;
  FirebaseService({required FirebaseRepository firebaseRepository})
      : _firebaseRepository = firebaseRepository;

  sendLedSetting(LedSettingData ledSettingData) async {
    await _firebaseRepository.sendLedSetting(ledSettingData.toJson());
  }

  sendMotorSetting(MotorSettingData motorSettingData) async {
    await _firebaseRepository.sendMotorSetting(motorSettingData.toJson());
  }

  sendTempData(Map<String, dynamic> json) async {
    await _firebaseRepository.sendTempData(json);
  }

  sendHumData(Map<String, dynamic> json) async {
    await _firebaseRepository.sendHumData(json);
  }

  getTempData() async {
    return await _firebaseRepository.getTempData();
  }

  getHumData() async {
    return await _firebaseRepository.getHumData();
  }
}
