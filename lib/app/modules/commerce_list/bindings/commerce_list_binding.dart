import 'package:get/get.dart';
import 'package:songon_on/app/data/providers/commerce_provider.dart';

import '../controllers/commerce_list_controller.dart';

class CommerceListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommerceListController>(() => CommerceListController());
    Get.lazyPut<CommerceProvider>(() => CommerceProvider());
  }
}
