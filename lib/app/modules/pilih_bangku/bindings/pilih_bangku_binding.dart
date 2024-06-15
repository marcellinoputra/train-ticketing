import 'package:get/get.dart';

import '../controllers/pilih_bangku_controller.dart';

class PilihBangkuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PilihBangkuController>(
      () => PilihBangkuController(),
    );
  }
}
