import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenwillmanager/data/services/firebase_service.dart';
import 'package:greenwillmanager/data/services/local_service.dart';
import 'package:greenwillmanager/routes/app_pages.dart';

class LoginController extends GetxController {
  LocalService _localService;
  FirebaseService _firebaseService;
  LoginController({
    required LocalService localService,
    required FirebaseService firebaseService,
  })  : _localService = localService,
        _firebaseService = firebaseService;

  final TextEditingController idController = TextEditingController();

  bool get isMyIdExist => _localService.myId != null;

  onPressStart() async {
    if (idController.text == '') {
      return showDialog(
          context: Get.context!,
          builder: (context) {
            return AlertDialog(
              title: Text('알림'),
              content: Text('아이디를 입력하세요.'),
            );
          });
    } else if (!await _firebaseService.isExistId(idController.text)) {
      return showDialog(
          context: Get.context!,
          builder: (context) {
            return AlertDialog(
              title: Text('알림'),
              content: Text('존재하지 않는 아이디입니다.'),
            );
          });
    } else {
      await _localService.writeId(idController.text);
      Get.toNamed(Routes.MAIN);
    }
  }

  goToMainPage() {
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => Get.offAndToNamed(Routes.MAIN));
  }
}
