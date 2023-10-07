import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/evenement_list_controller.dart';

class EvenementListView extends GetView<EvenementListController> {
  const EvenementListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EvenementListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EvenementListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
