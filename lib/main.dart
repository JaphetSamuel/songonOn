import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:pocketbase/pocketbase.dart';
import 'package:songon_on/app/data/providers/article_provider.dart';
import 'package:songon_on/app/data/providers/commerce_provider.dart';
import 'package:songon_on/app/data/providers/spot_provider.dart';
import 'package:songon_on/app/data/providers/user_provider.dart';
import 'package:songon_on/app/modules/actualite_list/controllers/actualite_list_controller.dart';
import 'package:songon_on/app/modules/auth/bindings/auth_binding.dart';
import 'package:songon_on/app/modules/auth/controllers/auth_controller.dart';
import 'package:songon_on/app/modules/commerce_list/controllers/commerce_list_controller.dart';
import 'package:songon_on/app/modules/home/bindings/home_binding.dart';
import 'package:songon_on/app/modules/home/controllers/home_controller.dart';
import 'package:songon_on/app/modules/profile/bindings/profile_binding.dart';
import 'package:songon_on/utils/style/my_theme.dart';
import 'package:songon_on/app/shareds/app_models.dart';

import 'app/components/home_banner/controllers/home_banner_spot_controller.dart';
import 'app/modules/profile/controllers/profile_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  // final box = GetStorage();
  final pb = PocketBase('http://31.207.35.158:8090');

  Get.put(AppModels());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      initialBinding: BindingsBuilder(() {
        // Get.put<GetStorage>(box);
        Get.put<PocketBase>(pb);
        Get.put<CommerceProvider>(CommerceProvider());
        Get.put<ArticleProvider>(ArticleProvider());
        Get.put<ActualiteListController>(ActualiteListController());
        Get.put<CommerceListController>(CommerceListController());
        //home
        Get.put<HomeBinding>(HomeBinding());
        // Get.put<HomeController>(HomeController());
        //spot
        Get.put<SpotProvider>(SpotProvider());
        //components
        Get.put<HomeBannerSpotController>(HomeBannerSpotController());
        //auth
        Get.put<UserProvider>(UserProvider());
        Get.put<AuthBinding>(AuthBinding());
        //profile
        Get.put<ProfileController>(ProfileController(),);
      }),
    ),
  );
}
