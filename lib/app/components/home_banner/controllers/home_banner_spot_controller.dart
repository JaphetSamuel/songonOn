import 'package:get/get.dart';

import 'package:songon_on/app/data/providers/spot_provider.dart';

import 'package:songon_on/app/data/models/spot_model.dart';

class HomeBannerSpotController extends GetxController {

  final SpotProvider spotProvider = Get.find<SpotProvider>();

  var banners = <Spot>[].obs;

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await spotProvider.getAll().then((value) => banners.addAll(value));
    print(banners[0]);
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
