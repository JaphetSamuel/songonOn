import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:songon_on/app/data/providers/commerce_provider.dart';
import 'package:songon_on/app/modules/commerce/views/commerce_modal.dart';
import 'package:songon_on/app/modules/commerce/views/commerce_search_modal.dart';
import 'package:songon_on/app/shareds/app_models.dart';

import '../../../data/models/commerce_model.dart';

class CommerceListController extends GetxController {
  CommerceProvider commerceProvider = Get.find<CommerceProvider>();
  var commerces = <Commerce>{}.obs;
  var categories = Get.find<AppModels>().CategorieService;

  void showCommerceModal(String id) async {

    Commerce? commerce = await commerceProvider.getCommerce(id);
      if (commerce != null) {
        showModalBottomSheet(
            context: Get.context!,
            builder: (context) => CommerceModal(commerce: commerce));
      }
  }

  void showCommerceSearchModal(){
    print('showCommerceModal');
    showModalBottomSheet(
      barrierLabel: 'Search commerce',
        context: Get.context!,
        builder: (context) => CommerceSearchModal());
  }

  final count = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    await commerceProvider
        .getAllCommerce()
        .then((value) => commerces.addAll(value));
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
