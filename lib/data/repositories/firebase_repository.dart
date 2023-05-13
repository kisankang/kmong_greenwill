import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class FirebaseRepository extends GetxService {
  DatabaseReference ledSetting = FirebaseDatabase.instance.ref("setting/led");
  DatabaseReference motorSetting =
      FirebaseDatabase.instance.ref("setting/motor");

  sendLedSetting(Map<String, dynamic> json) async {
    try {
      await ledSetting.set(json);
    } catch (e) {
      print(e);
    }
  }

  sendMotorSetting(Map<String, dynamic> json) async {
    try {
      await motorSetting.set(json);
    } catch (e) {
      print(e);
    }
  }

  sendTempData(Map<String, dynamic> json) async {
    await FirebaseDatabase.instance.ref('data/temperature').set(json);
  }

  sendHumData(Map<String, dynamic> json) async {
    await FirebaseDatabase.instance.ref('data/humidity').set(json);
  }

  getTempData() async {
    Map? result;
    await FirebaseDatabase.instance.ref('data/temperature').get().then((v) {
      result = jsonDecode(jsonEncode(v.value));
    });
    return result;
  }

  getHumData() async {
    Map? result;
    await FirebaseDatabase.instance.ref('data/humidity').get().then((v) {
      result = jsonDecode(jsonEncode(v.value));
    });
    return result;
  }
}
