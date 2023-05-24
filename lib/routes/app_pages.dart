import 'package:get/get.dart';
import 'package:greenwillmanager/module/login/login_binding.dart';
import 'package:greenwillmanager/module/login/login_page.dart';
import 'package:greenwillmanager/module/main/main_binding.dart';
import 'package:greenwillmanager/module/main/main_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.MAIN,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
