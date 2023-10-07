import 'package:get/get.dart';

import '../modules/actualite/bindings/actualite_binding.dart';
import '../modules/actualite/views/actualite_view.dart';
import '../modules/actualite_list/bindings/actualite_list_binding.dart';
import '../modules/actualite_list/views/actualite_list_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/commerce/bindings/commerce_binding.dart';
import '../modules/commerce/views/commerce_view.dart';
import '../modules/commerce_list/bindings/commerce_list_binding.dart';
import '../modules/commerce_list/views/commerce_list_view.dart';
import '../modules/evenement/bindings/evenement_binding.dart';
import '../modules/evenement/views/evenement_view.dart';
import '../modules/evenement_list/bindings/evenement_list_binding.dart';
import '../modules/evenement_list/views/evenement_list_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/parametre/bindings/parametre_binding.dart';
import '../modules/parametre/views/parametre_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.COMMERCE,
      page: () => const CommerceView(),
      binding: CommerceBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PARAMETRE,
      page: () => const ParametreView(),
      binding: ParametreBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.EVENEMENT_LIST,
      page: () => const EvenementListView(),
      binding: EvenementListBinding(),
    ),
    GetPage(
      name: _Paths.EVENEMENT,
      page: () => const EvenementView(),
      binding: EvenementBinding(),
    ),
    GetPage(
      name: _Paths.COMMERCE_LIST,
      page: () => const CommerceListView(),
      binding: CommerceListBinding(),
    ),
    GetPage(
      name: _Paths.ACTUALITE_LIST,
      page: () => const ActualiteListView(),
      binding: ActualiteListBinding(),
    ),
    GetPage(
      name: _Paths.ACTUALITE,
      page: () => ActualiteView(),
      binding: ActualiteBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
  ];
}
