import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import '../models/commerce_model.dart';

class CommerceProvider extends GetConnect {
  final pb = Get.find<PocketBase>();

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Commerce.fromJson(map);
      if (map is List)
        return map.map((item) => Commerce.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Commerce>> getAllCommerce({int page = 1}) async {
    var list = <Commerce>[];
    await pb.collection('commerce').getList(
      page: page,
      perPage: 25,
      filter: 'actif=true',
      fields: 'id,nom,description,categorie,image,collectionId,coordonnee'
    ).then((value) => list = value.items.map((e) => Commerce.fromRecord(e)).toList());
    print(list[0].toJson());
    return list;
  }

  Future<Commerce?> getCommerce(String id) async {
    final record = await pb.collection('commerce').getOne(id,
    );
    return Commerce.fromRecord(record);
  }
}
