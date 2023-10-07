import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:songon_on/app/data/models/article_model.dart';
import 'package:songon_on/app/data/providers/article_provider.dart';

class ActualiteListController extends GetxController {

  final PocketBase pb = Get.find<PocketBase>();
  final articleProvider = Get.find<ArticleProvider>();

  var articles = <Article>[].obs;
  var mostPopulars = <Article>[].obs;
  var selectedArticle = Article().obs;

  final count = 0.obs;
  @override
  void onInit()async {
    super.onInit();
    print("in actualité controller");
    await articleProvider.getMostPopulars().then((value) => mostPopulars.value = value);
    await articleProvider.getAllArticle().then((value) => articles.value=value);
  }

  void getArticle(String id) async {
    await articleProvider.getArticle(id).then((value) => selectedArticle.value = value!);
  }

  @override
  void onReady() async {
    super.onReady();
    pb.collection('article').subscribe('*', (e)async {
      await articleProvider.getAllArticle().then((value) => articles.value=value);
    });
  }

  @override
  void refresh() async {
    super.refresh();
    await articleProvider.getMostPopulars().then((value) => mostPopulars.value = value);
    await articleProvider.getAllArticle().then((value) => articles.value=value);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
