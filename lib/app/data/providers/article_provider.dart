import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';

import '../models/article_model.dart';

class ArticleProvider extends GetConnect {
  PocketBase pb = Get.find<PocketBase>();

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Article.fromJson(map);
      if (map is List)
        return map.map((item) => Article.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';

  }

  Future<List<Article>> getAllArticle({String? filter}) async {
    var liste = <Article>[];
    await pb.collection('article').getList(
      page: 1,
      perPage: 25,
      filter: 'actif=true',
      fields: 'id,titre,image,date_publication,source,collectionId, auteur,synopsys',
      sort: '-created',
    ).then((value) => liste = value.items.map((e) => Article.fromRecord(e)).toList());
    return liste;
  }

  Future<List<Article>> getMostPopulars({int limit = 4})async{
    var liste = <Article>[];
    await pb.collection('article').getList(
      page: 1,
      perPage: limit,
      filter: 'actif=true',
      fields: 'id,titre,image,date_publication,source,collectionId, auteur,synopsys',
      sort: 'popularite',
    ).then((value) => liste = value.items.map((e) => Article.fromRecord(e)).toList());
    return liste;
  }

  Future<Article?> getArticle(String id) async {
    Article? article;
    await pb.collection('article').getOne(id).then((value) => article = Article.fromRecord(value));
    return article;
  }

}
