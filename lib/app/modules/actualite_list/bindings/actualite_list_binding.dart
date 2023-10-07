import 'package:get/get.dart';
import 'package:songon_on/app/data/providers/actualite_provider.dart';
import 'package:songon_on/app/data/providers/article_provider.dart';

import '../controllers/actualite_list_controller.dart';

class ActualiteListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActualiteListController>(
      () => ActualiteListController(),
    );
    Get.lazyPut<ArticleProvider>(() => ArticleProvider());
  }
}
