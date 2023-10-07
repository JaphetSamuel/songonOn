import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:songon_on/app/data/models/commerce_model.dart';
import 'package:velocity_x/velocity_x.dart';

class CommerceModal extends StatelessWidget {
  final Commerce commerce;

  const CommerceModal({Key? key, required this.commerce}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(commerce.imageUrl()!),
          ),
          Text(
            commerce.nom!,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text(
            commerce.description!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              [Text("0"), Icon(Iconsax.like_11)].hStack(),
              for (var categorie in commerce.categorie!)
                Chip(
                  label: Text(categorie),
                )
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
            ),
            onPressed: () {

            },
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children:[
                Icon(Icons.phone, color: Colors.white),
                Text("Contacter")
              ]
            ),
          )

        ],
      ),
    );
  }
}
