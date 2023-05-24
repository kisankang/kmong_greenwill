import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalService extends GetxService {
  String? myId;

  GetStorage _box = GetStorage();

  Future<void> writeId(String id) async {
    await _box.write('id', id);
    myId = id;
  }

  Future<void> deleteId() async {
    await _box.erase();
    myId = null;
  }

  void init() {
    myId = _box.read('id');
  }

  @override
  void onInit() {
    super.onInit();
    init();
  }
}
