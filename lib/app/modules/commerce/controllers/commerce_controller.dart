import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class CommerceController extends GetxController {
  //TODO: Implement HomeController
  final mongo.Db db = Get.find<mongo.Db>() ;// mongo.Db('mongodb://31.207.35.158:27017/localto');
  var commerces = <dynamic,Map>{}.obs;

  final count = 0.obs;
  @override
  void onInit() async {
    print('HomeController');
    super.onInit();
    // await db.open().then((value)async {
    //   print('Connected to database');
    //   await db.getCollectionInfos().then((value) => print(value));
    // });

    var collection = db.collection('commerces');

    await collection.find().forEach((element) {
      print(element);
      commerces[element['nom']] = element;
    }).then((value) => print('Commerces loaded'));

    print(commerces.length.toString());
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
