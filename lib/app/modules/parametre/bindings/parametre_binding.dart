import 'package:get/get.dart';

import '../controllers/parametre_controller.dart';

class ParametreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParametreController>(
      () => ParametreController(),
    );
  }
}
