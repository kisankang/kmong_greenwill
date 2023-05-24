import 'package:get/get.dart';
import 'package:greenwillmanager/module/main/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(
          firebaseService: Get.find(),
          firebaseRepository: Get.find(),
          localService: Get.find(),
        ));
  }
}
