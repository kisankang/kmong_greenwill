import 'package:get/get.dart';
import 'package:greenwillmanager/module/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(
          localService: Get.find(),
          firebaseService: Get.find(),
        ));
  }
}
