import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import '../models/actualite_model.dart';

class ActualiteProvider extends GetConnect {

  final mongo.Db db = Get.find<mongo.Db>();

  static dynamic decoder (map) {
  if (map is Map<String, dynamic>) return Actualite.fromJson(map);
  if (map is List) {
    return map.map((item) => Actualite.fromJson(item)).toList();
  }
  }

  @override
  void onInit() async{
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Actualite.fromJson(map);
      if (map is List)
        return map.map((item) => Actualite.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
    print("in actualité provider");
    // await db.open().then((value)async {
    //   print('Connected to database');
    //   await db.getCollectionInfos().then((value) => print(value));
    // });
    print(db.databaseName!);

  }

  Future<List<Actualite>> getAllActualites(mongo.SelectorBuilder? builder) async {
    print("in actualité");
    var collection = db.collection('actualités');
    var liste = <Actualite>[].obs;
    await collection.find(builder).forEach((element) {
      liste.add(ActualiteProvider.decoder(element));
    });
    print(liste);
    return liste;
  }

  Future<Actualite?> getActualite(int id) async {
    final response = await get('actualite/$id');
    return response.body;
  }

  Future<Response<Actualite>> postActualite(Actualite actualite) async =>
      await post('actualite', actualite);
  Future<Response> deleteActualite(int id) async =>
      await delete('actualite/$id');
}
