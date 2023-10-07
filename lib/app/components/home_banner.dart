import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:songon_on/app/components/home_banner/views/home_banner_spot_view.dart';
import 'package:songon_on/app/data/models/user_model.dart';
import 'package:songon_on/app/data/providers/spot_provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class HomeBanner extends StatelessWidget {
  HomeBanner({Key? key}) : super(key: key);
  final PocketBase pb = Get.find<PocketBase>();

  final SpotProvider spotProvider = Get.find<SpotProvider>();

  User get user => User.fromRecord(pb.authStore.model);

  @override
  Widget build(BuildContext context) {
    return         Container(
      height: 300,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal.shade800,
              Colors.teal.shade600,
              Colors.teal.shade300,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...authZone(context),
            TextField(
                decoration: InputDecoration(
                  hintText: "Rechercher",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surface,
                )).h(40).px(20).py(20),
            const HomeBannerSpotView()
          ]),
    );
  }

  Rx<bool> isAuthenticated(){
    print(pb.authStore.isValid);
    return pb.authStore.isValid.obs;
  }

  List<Widget> authZone(BuildContext context) {
    return isAuthenticated().value?  [
      Align(
        alignment: Alignment.topLeft,
        child: "Bienvenue !"
            .text
            .size(18)
            .color(Theme.of(context).colorScheme.onSecondary)
            .make(),
      ).px(8).py(5),
      Align(
        alignment: Alignment.topLeft,
        child: user.username!.toUpperCase()
            .text
            .size(20)
            .fontWeight(FontWeight.bold)
            .color(Theme.of(context).colorScheme.onSecondary)
            .make(),
      ).px(8).py(3),
    ]: [Align(
      alignment: Alignment.centerLeft,
        child:TextButton(onPressed: ()=>Get.toNamed('auth'), child: "Se connecter"
        .text
        .size(18)
        .color(Theme.of(context).colorScheme.onSecondary)
        .make()))];
  }
}
