import 'package:get/get.dart';

import '../controllers/evenement_list_controller.dart';

class EvenementListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EvenementListController>(
      () => EvenementListController(),
    );
  }
}
