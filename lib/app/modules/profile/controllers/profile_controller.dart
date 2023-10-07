import 'package:get/get.dart';
import 'package:songon_on/app/data/providers/user_provider.dart';

class ProfileController extends GetxController {
  UserProvider userProvider = Get.find<UserProvider>();

  logout() async {
    await userProvider.logout();
    Get.offAllNamed('/auth');
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
