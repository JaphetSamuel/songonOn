import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:songon_on/app/data/models/actualite_model.dart';

class ActualiteCard extends StatelessWidget {
  final Actualite actualite;
  const ActualiteCard({Key? key, required this.actualite,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(actualite.imageUrl!, fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const ColoredBox(color: Colors.white),
          ),
          ListTile(
            title: Text(actualite.titre!, style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontFamily: 'SourceSansPro',
              fontSize: 18,
            ),),
            subtitle: Text(actualite.contenu!, style: Theme.of(context).textTheme.bodyLarge,),
            trailing: IconButton(
              selectedIcon: const Icon(
                Iconsax.bookmark_22,
                color: Colors.teal,
              ),
              icon: const Icon(
                Iconsax.bookmark_2,
                color: Colors.teal,
              ),
              onPressed: ()=>Get.toNamed('/actualite', arguments: actualite),
            ),
          )
        ],
      )
    );
  }
}
