import 'package:get/get.dart';

import '../controllers/evenement_controller.dart';

class EvenementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EvenementController>(
      () => EvenementController(),
    );
  }
}
