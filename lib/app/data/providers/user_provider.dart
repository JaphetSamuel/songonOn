import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
// import 'package:get_storage/get_storage.dart';

import '../models/user_model.dart';

class UserProvider extends GetConnect {
  PocketBase pb = Get.find<PocketBase>();
  // GetStorage box = Get.find<GetStorage>();

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return User.fromJson(map);
      if (map is List) return map.map((item) => User.fromJson(item)).toList();
    };

    // if(box.hasData('token')){
    //   pb.authStore.save(box.read('token'), User.fromJson(box.read('user')) );
    // }
  }

  Future<RecordModel> createUser(String username, String email, String password, String confirmPassword) async {
    final body = <String, dynamic>{
      "username": username,
      "email": email,
      "emailVisibility": true,
      "password": password,
      "passwordConfirm": confirmPassword,
      "name": username,
    };

    final record = await pb.collection('users').create(body: body);
    print(record);
    return record;
  }

  Future<bool> login(String username, String password) async {
    final authData = await pb.collection('users').authWithPassword(
          username,
          password,
        );
    print(pb.authStore.isValid);
    print(pb.authStore.token);
    print(pb.authStore.model.id);
    if(pb.authStore.isValid){
      pb.authStore.save(pb.authStore.token, pb.authStore.model) ;
      Get.appUpdate();
      // box.write('token', pb.authStore.token);
      // box.write('user', pb.authStore.model.toJson());
    }

    return pb.authStore.isValid;
  }

  bool logout(){
    pb.authStore.clear();
    return true;
  }
}
