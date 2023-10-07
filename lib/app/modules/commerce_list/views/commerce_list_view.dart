import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/commerce_list_controller.dart';

class CommerceListView extends GetView<CommerceListController> {
  const CommerceListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: ()=>controller.showCommerceSearchModal(),
            icon: const Icon(Iconsax.search_normal_1),
          )
        ],
      ),
      body: ListView(
      children :[
        Column(
          children: [
            [
              Text("Catégorie populaire", style: Theme.of(context).textTheme.bodyLarge,),
              Text("Voir tout ->", style: Theme.of(context).textTheme.bodyMedium,).onTap(()=>controller.showCommerceSearchModal())
            ].hStack(),
            for(var cat in controller.categories.values.take(4) )
              ListTile(
                title: Text(cat),
              ),
          ],
        ).h40(context).paddingOnly(top: 10),
         Obx(()=>controller.commerces.length > 0 ? [
           for (var commerce in controller.commerces)
             ListTile(
               isThreeLine: true,
               leading: CircleAvatar(backgroundImage: NetworkImage(commerce.imageUrl()??''),),
               title: Text(commerce.nom!),
               subtitle: VStack(
                  [
                    Text(commerce.description??""),
                    Text(commerce.categorie!.join('/')),
                  ]
               ),
               onTap: ()=>controller.showCommerceModal(commerce.id!)
             ),
        Divider()
         ].vStack() : CircularProgressIndicator().centered())
      ]
    ),
    );
  }
}
