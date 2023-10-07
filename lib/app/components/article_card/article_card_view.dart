import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

import 'package:songon_on/app/data/models/article_model.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          [Icon(Icons.account_circle).px4(), Text(article.auteur!)].hStack(alignment: MainAxisAlignment.start,).py(10),
          Text(article.titre!, style: Theme.of(context).textTheme.titleSmall,),
          Text(article.synopsys??'', style: Theme.of(context).textTheme.bodyMedium,),
          [const Icon(Icons.favorite),
            IconButton(onPressed: (){}, icon: Icon(Icons.comment)),
            Align(
                alignment: Alignment.centerRight,
                child: IconButton(onPressed: (){}, icon: Icon(Icons.share))
            )
          ].hStack(alignment: MainAxisAlignment.start,).py(10).w(Get.width),
        ],
      ).px(10).pOnly(bottom: 10),
    ).py2().px(8);
  }
}
