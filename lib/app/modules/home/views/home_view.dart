import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:songon_on/app/components/article_card.dart';
import 'package:songon_on/app/components/home_banner.dart';
import 'package:songon_on/app/components/tips_card.dart';
import 'package:songon_on/app/modules/actualite_list/views/actualite_list_view.dart';
import 'package:songon_on/app/modules/commerce_list/views/commerce_list_view.dart';
import 'package:songon_on/app/modules/profile/views/profile_view.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../data/models/article_model.dart';
import '../controllers/home_controller.dart';
import 'package:iconsax/iconsax.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          key: "home_page_view".text.make().key,
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomeWidget(context),
            const ActualiteListView(key:Key("page_actualites") ,),
            const CommerceListView(key:Key("page_commerces")),
            const ProfileView(key:Key("page_profile")),
          ],
        ),
            bottomNavigationBar: Obx(()=>BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Theme.of(context).colorScheme.onSurface,
              currentIndex: controller.currentIndex.value,
              onTap: (index) {
                controller.currentIndex.value = index;
                controller.pageController.jumpToPage(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.home),
                  label: 'Accueil',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.archive_tick),
                  label: 'Actualités',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.shopping_bag),
                  label: 'Services',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.user),
                  label: 'Compte',
                ),
              ],
            )),
      )
    );
  }

  Widget HomeWidget(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        title: Text('Songon On'),
        centerTitle: true,
      ),
      body: ListView(
        key: "home_page_list".text.make().key,
          children: [
        HomeBanner(),
        //Tips widget---------
          TipsCard(),
        //Tips Info widget---------
        Obx(() => controller.articles.map<Widget>((Article article){
          return ArticleCard(article:article);
        }).toList().vStack())
      ]),
    );
  }
}
