import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenwillmanager/data/repositories/firebase_repository.dart';
import 'package:greenwillmanager/data/services/firebase_service.dart';
import 'package:greenwillmanager/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  Get.put<FirebaseRepository>(FirebaseRepository(), permanent: true);
  Get.put<FirebaseService>(FirebaseService(firebaseRepository: Get.find()),
      permanent: true);

  var getMaterialApp = GetMaterialApp(
    theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)),
    debugShowCheckedModeBanner: false,
    getPages: AppPages.pages,
    initialRoute: Routes.MAIN,
    initialBinding: BindingsBuilder(() {}),
  );

  runApp(getMaterialApp);
}
