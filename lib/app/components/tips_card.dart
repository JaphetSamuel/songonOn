import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class TipsCard extends StatelessWidget {
  const TipsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return         Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Conseils", style: Theme.of(context).textTheme.titleMedium,).p(18),
          Text("Retourvez ici les conseil pour bien debuter").box
          .color(Colors.lightBlueAccent.shade100)
          .alignCenter
              .rounded.make()
              .h(60)
              .w(300)
              .pOnly(bottom: 10).px(10)
        ],
      ),
    ).py16().px(15);
  }
}
