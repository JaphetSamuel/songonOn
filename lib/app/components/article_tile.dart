import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:songon_on/app/data/models/article_model.dart';
import 'package:velocity_x/velocity_x.dart';

class ArticleTile extends StatelessWidget {
  final Article article;
  final _color = Vx.randomOpaqueColor;
  ArticleTile({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _color.withOpacity(0.5),
            _color.withOpacity(0.4),
            _color.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        isThreeLine: true,
        title: Text(article.source??'', style: Theme.of(context).textTheme.bodyMedium,),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(10),
            child: Image.network(article.imageUrl()!, fit: BoxFit.fill, height:110,width: 100,).box.roundedSM.make()),
        subtitle: [
          Text(article.titre!, style: Theme.of(context).textTheme.titleMedium,),
          [
          Text(120.toString(), style: Theme.of(context).textTheme.bodyMedium,).pOnly(right: 2, left: 10),
          const Icon(Iconsax.eye, size:16),
          Text(11.toString(), style: Theme.of(context).textTheme.bodyMedium,).pOnly(right: 2, left: 10),
          const Icon(Iconsax.message1, size:16),
        ].hStack(alignment: MainAxisAlignment.center, crossAlignment: CrossAxisAlignment.center ).pOnly(top: 10, left: 10)
        ].vStack(alignment: MainAxisAlignment.start,),
      ).py8(),
    ).py(4).px(8);
  }
}
