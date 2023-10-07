import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VStack( [
        ListTile(
          title: const Text("Déconnexion"),
          trailing: const Icon(Icons.logout),
          onTap: () {
            controller.logout();
          },
        )
      ],
    );
  }
}
