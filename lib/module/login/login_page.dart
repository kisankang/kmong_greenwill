import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenwillmanager/module/login/login_controller.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.isMyIdExist) {
      controller.goToMainPage();
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.idController,
                decoration: const InputDecoration(
                  labelText: '아이디',
                  hintText: '아이디를 입력하세요.',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: controller.onPressStart,
                child: const Text('시작'),
              ),
            ],
          ),
        ),
      );
    }
  }
}
