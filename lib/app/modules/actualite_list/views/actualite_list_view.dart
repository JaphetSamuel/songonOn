import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:songon_on/app/components/article_card.dart';
import 'package:songon_on/app/components/article_tile.dart';
import 'package:songon_on/app/shareds/components/ActualiteCard.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/actualite_list_controller.dart';

class ActualiteListView extends GetView<ActualiteListController> {
  const ActualiteListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.teal.shade900,
            title:
                const Text('Actualités', style: TextStyle(color: Colors.white)),
            centerTitle: false,
            actions: const [
              IconButton(
                onPressed: null,
                icon: const Icon(
                  Iconsax.search_normal_1,
                  color: Colors.white,
                ),
              )
            ]),
        body: Obx(() {
          return controller.articles.isEmpty
              ? const CircularProgressIndicator().centered()
              : ListView(children: [
                  // Text(
                  //   "A la une !",
                  //   style: Theme.of(context).textTheme.titleLarge,
                  // ).p(16),
                  VxSwiper(
                      autoPlay: true,
                      items: controller.articles
                          .map((article) => ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                          child:Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(article.imageUrl()!, fit: BoxFit.fill,),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: ListTile(
                              tileColor: Colors.black.withOpacity(0.5),
                              title: article.source!.text.white.bold.make(),
                              subtitle: article.synopsys!.text.white.make(),
                            ),
                          )
                        ],
                      ))
                              .box
                              .px12
                              .rounded
                              .make())
                          .toList()),
                  for (var article in controller.articles)
                    ArticleCard(article: article),
                  for (var article in controller.articles)
                    ArticleTile(article: article)
                ]);
        })).paddingOnly(top: 10);
  }
}
