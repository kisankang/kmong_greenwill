import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:greenwillmanager/data/models/led_setting_data.dart';
import 'package:greenwillmanager/data/models/motor_setting_data.dart';
import 'package:greenwillmanager/data/services/local_service.dart';

class FirebaseRepository extends GetxService {
  LocalService _localService;
  FirebaseRepository({required LocalService localService})
      : _localService = localService;

  DatabaseReference get ledSettingRef =>
      FirebaseDatabase.instance.ref(_localService.myId! + "/setting/led");
  DatabaseReference get motorSettingRef =>
      FirebaseDatabase.instance.ref(_localService.myId! + "/setting/motor");

  DatabaseReference get tempDataRef =>
      FirebaseDatabase.instance.ref(_localService.myId! + '/data/temperature');
  DatabaseReference get humDataRef =>
      FirebaseDatabase.instance.ref(_localService.myId! + '/data/humidity');

  sendLedSetting(Map<String, dynamic> json) async {
    try {
      await ledSettingRef.set(json);
    } catch (e) {
      print(e);
    }
  }

  sendMotorSetting(Map<String, dynamic> json) async {
    try {
      await motorSettingRef.set(json);
    } catch (e) {
      print(e);
    }
  }

  Future<LedSettingData?> getLedSetting() async {
    LedSettingData? result;
    try {
      await ledSettingRef.get().then((v) {
        Map<String, dynamic> json = jsonDecode(jsonEncode(v.value));
        result = LedSettingData.fromRTDB(json);
      });
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<MotorSettingData?> getMotorSetting() async {
    MotorSettingData? result;
    try {
      await motorSettingRef.get().then((v) {
        Map<String, dynamic> json = jsonDecode(jsonEncode(v.value));
        result = MotorSettingData.fromRTDB(json);
      });
    } catch (e) {
      print(e);
    }
    return result;
  }

  sendTempData(Map<String, dynamic> json) async {
    await tempDataRef.set(json);
  }

  sendHumData(Map<String, dynamic> json) async {
    await humDataRef.set(json);
  }

  getTempData() async {
    Map? result;
    await tempDataRef.get().then((v) {
      result = jsonDecode(jsonEncode(v.value));
    });
    return result;
  }

  getHumData() async {
    Map? result;
    await humDataRef.get().then((v) {
      result = jsonDecode(jsonEncode(v.value));
    });
    return result;
  }

  Future<bool> isExistId(String id) async {
    bool result = false;
    await FirebaseDatabase.instance.ref(id).get().then((v) {
      if (v.exists) {
        result = true;
      }
    });
    return result;
  }
}
