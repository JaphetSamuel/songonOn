import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';

import '../models/spot_model.dart';

class SpotProvider extends GetConnect {
  PocketBase pb = Get.find<PocketBase>();

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Spot.fromJson(map);
      if (map is List) return map.map((item) => Spot.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Spot>> getAll() async {
    var result = <Spot>[];
    await pb.collection('BannerSpot').getList(
      perPage: 7,
      page: 1,
      sort: '-created',
        fields: 'id,description,Image,link,titre,collectionId,collectionName'
    ).then((value) => result = value.items.map((e) => Spot.fromRecord(e)).toList());
    return result;
  }

  Future<Response<Spot>> postSpot(Spot spot) async => await post('spot', spot);
  Future<Response> deleteSpot(int id) async => await delete('spot/$id');
}
