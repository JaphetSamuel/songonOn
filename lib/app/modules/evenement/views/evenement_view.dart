import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/evenement_controller.dart';

class EvenementView extends GetView<EvenementController> {
  const EvenementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EvenementView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EvenementView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
