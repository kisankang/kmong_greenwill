import 'package:get/get.dart';
import 'package:greenwillmanager/data/models/led_setting_data.dart';
import 'package:greenwillmanager/data/models/motor_setting_data.dart';
import 'package:greenwillmanager/data/repositories/firebase_repository.dart';

class FirebaseService extends GetxService {
  final FirebaseRepository _firebaseRepository;
  FirebaseService({required FirebaseRepository firebaseRepository})
      : _firebaseRepository = firebaseRepository;

  sendLedSetting(LedSettingData ledSettingData) async {
    ledSettingData.isWrite = 1;
    await _firebaseRepository.sendLedSetting(ledSettingData.toRTDB());
  }

  sendMotorSetting(MotorSettingData motorSettingData) async {
    motorSettingData.isWrite = 1;
    await _firebaseRepository.sendMotorSetting(motorSettingData.toRTDB());
  }

  Future<LedSettingData?> getLedSetting() async {
    return await _firebaseRepository.getLedSetting();
  }

  Future<MotorSettingData?> getMotorSetting() async {
    return await _firebaseRepository.getMotorSetting();
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

  Future<bool> isExistId(String id) async {
    return await _firebaseRepository.isExistId(id);
  }
}
