import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

import '../data/models/article_model.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.teal.withOpacity(0.7),
            Colors.teal.withOpacity(0.6),
            Colors.teal.withOpacity(0.4),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius:const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(article.imageUrl()!, fit: BoxFit.fill, height:150,width: Get.width,).box.roundedSM.make()
          ),
          [Icon(Icons.account_circle).px4(), Text(article.auteur!)].hStack(alignment: MainAxisAlignment.start,).pOnly(bottom: 5),
          // Text(article.titre!, style: Theme.of(context).textTheme.titleSmall,),
          Text(article.synopsys??'', style: Theme.of(context).textTheme.bodyLarge,).px4(),
          [
            Text(120.toString(), style: Theme.of(context).textTheme.bodyMedium,).pOnly(right: 2, left: 10),
            const Icon(Iconsax.eye, size:16),
            Text(11.toString(), style: Theme.of(context).textTheme.bodyMedium,).pOnly(right: 2, left: 10),
            const Icon(Iconsax.message1, size:16),
          ].hStack(alignment: MainAxisAlignment.center, crossAlignment: CrossAxisAlignment.center ).pOnly(top: 10, left: 10)
        ],
      ).pOnly(bottom: 2),
    ).py(4).px(8);
  }
}
